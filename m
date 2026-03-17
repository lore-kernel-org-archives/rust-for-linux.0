Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42573FA5DD;
	Tue, 17 Mar 2026 22:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788070; cv=fail; b=lp2s+PrWCAlKHOtN3oQO1/bYZaVnsQv+Mh5nPYkwOUMW1QoWqgHBCsEpa2tOe/2+J5Qy/Je0d55EbfdR5cUEUZNRd3RWqFiGZr0jXi8b8U1G6zL3lyJ8pwMEQGyrUup2iiaLvL6G5Q/Y1Y9y95QUyCEk1mPHAbL6yaFhs1CEPp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788070; c=relaxed/simple;
	bh=dXR3t0LZJm+jakgskbQFTU1Ve7A/1CgOThuNNlU+C/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LArklFeJNQXDbO7m309zUEAaiUzH1TGzcUpCwnZrH7NxuKz2d80+mM1j1MO/MnV3R8GD5IPIYjL1nMqgbB4w9K7fs71r4tLfU6xfzFYrrjFYa3IE5XVexf9J09tqGIif6XFEOIwZMk1b5ParJrrBBDpSFMqzOVq+UsXX25HalXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JvZLnslb; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JvZLnslb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jnu50D0PrdVB3ZPd0kv0Y4A01mCI0bR4sxklOqfpWiHiKbgOb4jPcU5QcV+yCYktjV4kkKSxMbQ/UqCUEGFIijuZWLY97I8wAKJKsEi0Pk3FQvsHlbWeTDm/eOyBTcixeRSNUTdkN1FZE7HdL3JzrULSeaNcTDh9tYRegzPAwdWGhJcjIRnwvPe5vqmEt2qYQbFbBXwyLszr0YneVNFt+wGU5gB0s4bdKfiCxQwSzPX6IVyuQ+ZHfYB0F9Sj9Jn4bC1qZ5TREe2TOvSZ4kqwJDxQ5UICvvZqGfu028EzRVwH7HBEOPHUyUdXJHQ2oBTnfW7oKRd5q9Ke3jBlGsWk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mtt/OKkiOahKRBvb4nHmvsF2sNBRQikoj7/lkRETgBA=;
 b=fX2z5iztjdvMr6eYa+TXvZyLKaBZunxpM4ANx4CdF9M0kimuK/BBN/J2n4cqiAp6h7ejjP7tzLHfIuGIvLhfNoCaHCC7y1Z941or17lNgAbVWelLmmeRcKn+h8URxW+c1+JM0PoxzWSfNw4DlEFAQuWaBiG8YKel9hucviiaZ+Sp+cNLDX3//3udAOHQ84Bdam9Lp/PAzqOFO2yY7L6zUr4cSqhHDU4XleqC8AualjP2mFazzcTZYxJvrobtQL/ce+xKwuP5Na4kXnw1iJvP8pXpjI2Lc2/e4pnBTQjx/vA+cfvHV8pZxao55xwpvTg8lMPpIjuoWmkQM37oCBApUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtt/OKkiOahKRBvb4nHmvsF2sNBRQikoj7/lkRETgBA=;
 b=JvZLnslbkWx811iyIJsbveWZrYM207y6EyfGLWUuthBeWAUzRajYrCtgEXziWmff1D8koBAh5I9eVaBeIRf0rfANj4cHWur2a9HC0D7/2FTZnTNVjfN3Au6IePJ7fI+JsPazBt+mzZm4O4pAaaUYUrMEdn3whIZLmJ9x31If1BDEpk3OvY3khkiJVyvnzAVYtgERYCDahGnlT4MhogMIEkaNZ9sG7xWWxtusIQ3YL7sflOaJmCR7nesFYStTJQObMTOr2aZvRqDEZZtoCZjeS+oCNr4Vzy4gbCIC19NyerUx9r4SGq4CyAHAf07TVyR6r6zX8Y+j3shRvCxRXGccyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:19 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v7 15/31] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Tue, 17 Mar 2026 15:53:39 -0700
Message-ID: <20260317225355.549853-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddb7cc8-c4fc-451a-ef44-08de84781e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Sg9VguOk3cahjq1wXmEKNUJsNnnkvul0g0cN06+qZ+iP0FaO5AjoyXeTdEDC8gRmAc0LnT10M2LAbAlJ/sFcI2gFuumZ/XW/bBS+orchXuZpAmAycPRvBGCBYCluOaMyyz62AOXr6r7/D18WRasAXTDWZnyW7JAF69BrjhXpVv3uzH/uTqtnAqtkZ1PxzZ2XfOKihTDkPjWkKVycYzHutpGaloUSmtqYMJ01S1PESmv7s6v3PlSS9OD/1+Satbmdgnw6ScjzwPuOmFLfJ+Z3ZWNHMI+eUT57kmU9PWlEOfZUX93Jvw41ir4SiHyK8UMui4u22og4pYheqVFHanRKd+7yqU6i+fdHMxuV2oxXkl+PBqqNtOtnSGp6Y3ibRSbzHyq8WDw7o7zsrzfsA/UCtb1MIU8zi94KH019wuz17/yGzJNH9AyNX0vH7ZjNDqqdxrP0c14G+ZsxNXBWkI279qse7bukKdoURzXRR5ttmUjrCVofU+e4o4wiY9Y7G16HfI1XPkPdDEKguAaVMeWMnX8yaE8H/NXMW0FL1A9K8uXn+Hqb5OtvzmMaSphRlV7tz7WlkKvm2faHrlgtfs3HYpIGgnXkSl9s99CgaQZS5tITt+lUx0wo1WKIMhmF3fcDeN5HC1GGyOkdumySHA+lx+wudxufH8pYprdbUuKNhibgXEE7WrA/ZbNsiKN9ErPv4hTxRuZLRLjo+PbJh4RivV2jVh4EdLZ04cy94ivCwEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?so9aP1inJ19WcZkvtsXutB6PPf2qcwe2mEt/A70Qp4F8yl4jljzg4hrTFkGL?=
 =?us-ascii?Q?ttGzN0bfrei8sE3uk7WYcu6pzp870bh9ZCl/zcvdH8jSmXDLJAzI+bbyXTbC?=
 =?us-ascii?Q?2mrCcoVgkMBvGWeTO3XAdwJQsLkkkIRN4OdzmBcUD1GTBSMnLIzdUdPfAN77?=
 =?us-ascii?Q?7ODXGu25QCEdG+BzQGNQoGb3oW60Nz6k1Cqf88rHwrKS6brdNtMq5WSWGFrW?=
 =?us-ascii?Q?8c249JZjhjEGgObt4p56RFIF7gqy0tR+mDnAHlBEF3Q58B0CpM1diw6+acXI?=
 =?us-ascii?Q?lPNHoydMST4NecXrmNL0y3bcEXuZGa9SuDFyJnDT1F5p/QbZypJO0w2JA15c?=
 =?us-ascii?Q?9dIefHezAMEbiziK+5gIICZ3U5hBbUR0GPR4ZwHAf/5U3JBjpwe4hosQYtnv?=
 =?us-ascii?Q?IAWSY/0LbwbBPf+fm5SKFQe4m0ck8ijv5P7rhuqyzryTWZUgkzpUlQmyudHd?=
 =?us-ascii?Q?EFsNZrZcn74l+N8QS3Yld8eNDfOywHMcA+EQFg9xTr1auzde8GS3zW0wZIE3?=
 =?us-ascii?Q?2g30xEO1x0CEx4zlmYFI1YOb3BtupANvF19fGDotJli+mXkExJ/uedFDNS+s?=
 =?us-ascii?Q?sHa6qNb0t+pFforswdIpJ+iLzsOmw0O9gmQ7YV8XjGV8pAmME9nTRZ6tGKO9?=
 =?us-ascii?Q?p+rXwhaJFdvzsAnHDpmCY3F2r+ZAIN/FAjk4Rna7MBe87rHRF4LeprcGL6V2?=
 =?us-ascii?Q?Irdga+T4SmKmocxiv1lCxluRaJt+0baQxzTUwN/G0iQywcV/kjMP0rGzyPWt?=
 =?us-ascii?Q?qy76JgDwnZKUD2U5jS0TZC3F7cWLuBeB5JhNpW+5ftvsTpBmdBMqEPpBaEcZ?=
 =?us-ascii?Q?vPw8bBSQhJ/CRmhOrFrgwjE17qHR5Ynh17f6mC8swE1RCB37ti0Xoyvj7q+K?=
 =?us-ascii?Q?Wj/D/zKI1wC0G86oFPzckT5y18aDhWoWKo+4h+mXIoWb365DhCYJgpIavVaW?=
 =?us-ascii?Q?E2M5rqkSXtmKhWjkZ5tCwpJgvFyUlq7Mly3vsNLtXXMMZm/z+kzPDha6EimJ?=
 =?us-ascii?Q?OW27qvUBfcNbwiu4NGtpI3iCjcPPW20nhliV4MgjIzSe5LWeK8mZWDUtLNup?=
 =?us-ascii?Q?90RRBmoONnteTJHQHvgtKGS8OKT5CFls4CO3waN3LILT2B1wlSiu1S/CDfxW?=
 =?us-ascii?Q?Yu7yRICzTSQOO2M2wYUgZrICHQjxTYNbm9plVYAnxj4awEVnH/PwcX0hArXJ?=
 =?us-ascii?Q?7Hyc5fye147VUDtmeWSsoDUsF+bgDmB3vekLZNz19eib6ADw3Ex9IxAJHzjo?=
 =?us-ascii?Q?26N/dCL6P+K9BygCTOe1cEqMfnKgsf7FcD/LdK6i0HHSbX/Y38jqDW1s+7wo?=
 =?us-ascii?Q?fcszPFfa+ub84OyMzdSLk9GIFu+fjH7CQNxzAiWKuffZ82oF433aYCbfFsJl?=
 =?us-ascii?Q?pkpOAEoDnvXgnyqI8tkORGRhAJgVG94tQWQffrQTXhdcjZCxiePK2B9Zw7zx?=
 =?us-ascii?Q?gyD8YLKA8pSGXdBzScfVjFkO33xt9lzPrCmIZWMmhSHGLKCZiwN7ccRXOywa?=
 =?us-ascii?Q?UqHslMDd/2yP9b/FNaBV4L4J2Otj3EFU6NL8VuEULmwTx2Hve6JSuHauca+l?=
 =?us-ascii?Q?Sz6gq1eYq0Rv5fZA9JdFkEiPrUH6JfIG1dODFNww+FBBtlkXM+ruLJ7EiwgX?=
 =?us-ascii?Q?xfgP3BTJzg1qyydIroh3U7B6koGFF4Bpkm3J2yxIbXrRjhBdlr4s51o5w/r8?=
 =?us-ascii?Q?nuSjaCaEttRaCdIR+AXE4tKeHojYEWA9fimIb0ATnMhBcKdDnUqLdpka+3pT?=
 =?us-ascii?Q?NpdfsT6ROA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddb7cc8-c4fc-451a-ef44-08de84781e9a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:17.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neRf+tGTlK2kawsn+XASeEN1mxqY4a7TyABF7xhPfbCv7rP8w+azYM6K4qiLM3+GsdFaQXFWNTDfBYUTmCfvGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 79 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 18 +++++++
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 29a68d6934a9..faf923246ae9 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -108,7 +108,6 @@ pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
     ///
     /// Data is interpreted as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -129,7 +128,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     ///
     /// Data is stored as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -145,4 +143,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular - pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[expect(unused)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
+        let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        tail.saturating_sub(head) + 4
+    }
+
+    /// Send message to FSP.
+    ///
+    /// Writes a message to FSP EMEM and updates queue pointers to notify FSP.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `packet` - Message data (must be 4-byte aligned in length)
+    ///
+    /// # Returns
+    /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
+    #[expect(unused)]
+    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers - TAIL points at last DWORD written
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        regs::NV_PFSP_QUEUE_TAIL::default()
+            .set_address(tail_offset)
+            .write(bar);
+        regs::NV_PFSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+
+        Ok(())
+    }
+
+    /// Receive message from FSP.
+    ///
+    /// Reads a message from FSP EMEM and resets queue pointers.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `buffer` - Buffer to receive message data
+    /// * `size` - Size of message to read in bytes (from `poll_msgq`)
+    ///
+    /// # Returns
+    /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
+    #[expect(unused)]
+    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        regs::NV_PFSP_MSGQ_TAIL::default().set_address(0).write(bar);
+        regs::NV_PFSP_MSGQ_HEAD::default().set_address(0).write(bar);
+
+        Ok(size)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index f577800db3e3..686556bb9f38 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -473,6 +473,24 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     31:0    data as u32;        // EMEM data register
 });
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust
+// These registers manage falcon EMEM communication queues
+register!(NV_PFSP_QUEUE_HEAD @ 0x008f2c00 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_QUEUE_TAIL @ 0x008f2c04 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_HEAD @ 0x008f2c80 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_TAIL @ 0x008f2c84 {
+    31:0    address as u32;
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

