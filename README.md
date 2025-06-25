# **cisco-enterprise-gns3-network**

A comprehensive GNS3-based enterprise network built with Cisco IOS and ASAv
platforms, demonstrating scalable design, advanced routing, high availability,
security integration, and structured network documentation.

---

## Table of Contents

---

## 1. Overview

### 1.1 Network Purpose and Scope

This repository presents the design and implementation of an enterprise-grade
network built using Cisco networking and security technologies. Constructed in
GNS3, the network demonstrates a layered, secure, and scalable architecture
that integrates core routing, switching, VLAN segmentation, redundancy,
security policy enforcement, and remote connectivity via site-to-site VPN.

Developed through a combination of real-world experience, CCNA coursework,
self-study, and hands-on experimentation with Cisco IOS and ASA platforms,
this project serves to showcase my ability to design, configure, and document
a complex network environment in alignment with industry best practices.

This repository is intended for technical professionals and hiring managers
seeking to evaluate my practical understanding of enterprise networking and
security principles. I invite you to explore the implementation details that
follow, which reflect both my technical proficiency and my commitment to
clean, structured network design.

### 1.2 Technologies and Skills Demonstrated

This section highlights the key technologies and networking concepts
demonstrated throughout the network implementation.

#### Routing and Switching

- Open Shortest Path First (OSPF) for dynamic routing
- Hot Standby Router Protocol (HSRP) for gateway redundancy
- Inter-VLAN routing for network segmentation
- Layer 2 switching (access and trunk ports)
- Layer 3 routing (subinterfaces)
- Layer 3 switching using Switched Virtual Interfaces (SVI)
- VLAN Trunking Protocol (VTP) for VLAN synchronization
- EtherChannel with LACP for link aggregation and redundancy
- Rapid PVST+ for loop prevention and per-VLAN spanning tree configuration
- Manual root bridge assignment for VLANs to control traffic paths

#### Security

- Internet Key Exchange version 2 (IKEv2) and IPsec for secure tunneling
- Access Control Lists (ACLs) for traffic filtering and policy enforcement
- Static and dynamic NAT/PAT for address translation
- Port security (MAC limiting, PortFast, BPDU Guard) to prevent unauthorized
  access
- Secure remote access via SSH version 2
- Access control for VTY lines using ACLs
- Disabling of insecure services (Telnet, HTTP, CDP, DTP)

#### Network Services

- Dynamic Host Configuration Protocol (DHCP) for IP address assignment
- Network Time Protocol (NTP) for clock synchronization
- HTTP server deployment for service demonstration
- Static NAT for internal server accessibility

#### Automation and Testing

- Bash scripting for automated network validation
- End-to-end testing of connectivity, NAT, and ACL policies
- Public IP range simulation for external access testing
- External client simulation for validating web service accessibility

#### Simulation and Management

- GNS3 virtualization platform for network simulation
- GNS3 Cloud Appliance for integration with the host network

---



