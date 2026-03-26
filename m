Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6FA38CFF8;
	Thu, 26 Mar 2026 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489178; cv=fail; b=WLxmLBjhyo6mdsbP19JF7Zbj4b8Esaf+6PneI6C+2+Mlcb5/Iwh7nDKsth2D5F3hgQDMAUx1b2pcVN80qIQwYGl+MiKOrTaajmLla/Jjli40MqrAPODpzpQ0QuYJJuYnLv/kksMoyf1MddkqdBl8EZVr5RYK60Vtp/h6G8eLEEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489178; c=relaxed/simple;
	bh=dXR3t0LZJm+jakgskbQFTU1Ve7A/1CgOThuNNlU+C/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tf8GT9VaGTM968+Lyg+MMcpZQ39hUfG3UDqistzR33eqewg0tDeftaksz5lSnM2g3lZE0g/DqQC+xGgeINQ8XeAMe104pdUx6ZmjaRbjKfUaayGkrl19bbiLlK+NnNzZB3Q1HQzXyFU7EBcFSEBpO6leglw9tCaTe6Aj/pUorKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S55ti7XR; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S55ti7XR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7bWutJc2KA/qPCHaflRc1SP+zgIFNdN5qv1QiV2QOUkm6yb0XD9XBr9sTrw1s5xqt4bWEZ/fl31MtaKkcjmBzQCeDRXvZNDnvoFMKCBT+D8cDRTizGQwVos012apYitgJyJunQ8WOrn4fosXfKpyYxrX+fXbqvKzZOYLzN0zfSoTTkcaQBygi2XGr53SplPAxS8o5+d8oNjWXZNl+xwnGYrtLOKoxlH67jGhcMgU60pGFPIaKuM7GXSsNQD/NwWPz6pIWmkl9EStwcbdQa0aYJQprjQi24Z71prAsk/6T0g+0PXMLMMX2ECUtymeTecCAUSCksYXj75slxw2/xR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mtt/OKkiOahKRBvb4nHmvsF2sNBRQikoj7/lkRETgBA=;
 b=uBnOX3ICICK3SKdyyblAB+l+04wKDqnjmUDZSA/Gu6ACBLMpB69H2AufXidf6oQ88ShqcqLw5OUXXcmbGTcZyTnpFSlPpDTMSzPWp7142H1cIidSJIPd5h8HsMJK2Qu5bGVZybH0C371d24iHuzGrZ81McF8KWQmgaINp93KlJOJL49V+viQ1VtRM9hSp7CNSWLLCUD7iNlXsKWA3Ueelp28AVyF1vKXuCXT3522tCo4DsfVFRb+t30Prp7+n/b+vaUsT1L3xUyNRw9AMNGUpjiZOPspweQSHpHDVhJ7BcCDFfIXB1eE4XVXBndYPP3d7T61XL0KS0vhGwQSA7nngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtt/OKkiOahKRBvb4nHmvsF2sNBRQikoj7/lkRETgBA=;
 b=S55ti7XRAQvURITnG4VfYbYwYWNF1F8wIwdxbd96987STt3pho6K8IXOn/yg5g0CzvDNfFbst3XpBVytJlsKX29ZDNf6HWgwKKXkmgCLex7MVj8+c5qAph6g8SBm3ulrDg05FmcJ396vwRIYMOgoncc1LAF/HDiPWNBH1u8IM1/msAJKhkxl6gBvx2KVEEj7gn1rAfNieRRBNrZ2O//DNrWXfRMb/pCS3P5d375G5cxatkYMHwmh0Kb3sGaK5YvYZVDd5x3yDX3jk0yDiKaYpr4901Wx0gsodEmuO4MuxwxQjQIFgfqXXzoLigA/5ZsD9753IE1yu/7GHKXx83mhpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:28 +0000
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
Subject: [PATCH v9 15/31] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Wed, 25 Mar 2026 18:38:46 -0700
Message-ID: <20260326013902.588242-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5dac2c-4ec4-4361-289a-08de8ad884fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0WswBgj73aK2HKqeWMP0u2f+/Gy/Ghmdj0pynOR42e/c3GssDVOEgCMh/FsN51o7Csoa4V7AavRpS09+LXV8+B/ETfjhm4JubIVG+n9mjJDFzGS+FE4uHtp3IPuOuGg7b6cFgRqfTwgXrSSuaS9F6nKTYtYyNmJxpGbFDq/cEAUCpKGVB/M/89f/fhEnuD05/EmNM/YkRuZwsAJ2bJTfrX/+TTb56USAIw5FrAZ1RjzfMBDDZcidlYuacNDK7WTyMXHWXU9SMOXXtbJUfjO0WlMQfqIqHVYWtfdt233jT8Cvpsx/NnxgbcID2Go9a7xrOk8uI+GmRp00HJsuJKWn9L6zZW3Hcu/e1fW70xsNnDPKDTDpXZuAdmHMWfkuniCCEJGkdtgXjfKs27TgW1YdLhAd6kgsYCI+mAkMgu21qg0PR/JS79HSMubTBiazlpyW2n1873Ze0bmysTwkAgHxXQun5u4H6Z8WBXKOgeAucJ703uK5o7xuALYDNGS5TwQeVNURt06fSnACrhSgmJLW680LboRBLytl051bL3FmPug5yw4oUySv9quwlL5gxit+4TxxqOMmrP3cuFgMJWShOGXknEoG5WymbhzhR/G0d/h3BH8UE9rlxoY/3mjwjS+iIl81lIKFaoC4bmNQsT4lEF938U/7DDqC6RGjGfurmnb6l0BI5C2iVwzr3p+DPdtUEVd+3YuK45mjN+y7oQ8nn36qDsy3iWTTnIlovCl7v7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QmH/zHcS55LEyhxKoMVzbYKNiNlSH+XDxQj+sXG/DAICex2hLPs7cfhsuiol?=
 =?us-ascii?Q?5JY2HX2uip5Q0dYVe6uveD7fOXCKiAUNEu5+xk5Thz0+ArujMc3GPS/UvZJ2?=
 =?us-ascii?Q?PTpmjueKC00ov+2fk3OFsg7AUXC+lxCOC7rt9O9iklnYWOSrq1OS7XPC/CEX?=
 =?us-ascii?Q?qiTWmWHs70EMcIGExpnveAeA9K54uj/pqq6r+a/8OGdpKsizu7Dv7//S2aAh?=
 =?us-ascii?Q?SiBYilCwswrtQm6UtOU19l9hjZBtPTCyInjIPxK9K75wvrFdvDwaRvAleyzT?=
 =?us-ascii?Q?mEgvDfkqfT+Zfd1Mu7FGt5vTcLLI+WVJt+0LB0rm5gXcTd/6q1NRUYklXk0U?=
 =?us-ascii?Q?rgu/DRBA1XtlKoMhphWFEgihTNXx3tIeRViA4QMmJADAl1mt+nW/nR1ngzTN?=
 =?us-ascii?Q?TlouAAZtP3/0RCAinSyE5VWFF+RON7khGLcBQwM5VvOuJFLbHkHQbniI2M6G?=
 =?us-ascii?Q?e0PIEUUGzs3r8DpuS0M67uEg+BK3/Jw4OXOLfs26EJH+UDTfmeS2GebFu7GH?=
 =?us-ascii?Q?5jrSMZq6ETQhPoacz/Pz0/yb6nvREvwCpjSs3nM2rGBVZfplCob7Y3NIp3/0?=
 =?us-ascii?Q?f1Xf/WCvDr9cRjPcGS8EWh18PoqpRaGrbKRs34p5cDvbRFwujs9P/O7Ge7bw?=
 =?us-ascii?Q?1NSZZhJiwoSAcy6XMoWVuEj9xMYNfF8pJomg5DCzYG7weVNEY8VvtgWrSv/H?=
 =?us-ascii?Q?iBmFkxDmJtf64yzmvPIos/04l0pWl+WqxvjWpoUA9/Z/DxZBWv6PU7QokvRZ?=
 =?us-ascii?Q?LA6X9lTrJNcqUnRqN4baPr/GvFw3HSPNnF6ihDcww1eETJ92D0DSFwVMvfbR?=
 =?us-ascii?Q?kp4xhu1qscfzNBTB+XsoznxJeqX7tPT7tincNuQn1QP7edmpoaMDTfZeQFvd?=
 =?us-ascii?Q?gpVnWN0ShqGEE5iacyFzZpxHkFerLMk9chUSL0EHm4ZLDy/TyP0o04s+SPw8?=
 =?us-ascii?Q?FOx2TkQLFoGBmyhUMvwOlWSsXlaCjaqWb1ZwnHAfniVFX8M9Sotq/if7Lj+r?=
 =?us-ascii?Q?6cZ5lq7rqOmL1PsbD17PCsht9xeoH6AfR23ZBUcDu6TXR1I6mkydRawc29S4?=
 =?us-ascii?Q?p2TIktIHjxlOWtP2oUYsgBKiqcZxrY+VIdgSfR9z6vvHIDaTu6tVPGz/2MYU?=
 =?us-ascii?Q?vXG1FanJuvZB017+o3/k6h/dXCPv8oe+dGqQje+BjK+ZAWOiy7LUVSVnz0xy?=
 =?us-ascii?Q?rxhhJ8r6oACRwXjbPCkZD7qocQqx4naNPCHiHSDinzG0rVAHJer5Qtq/1xx/?=
 =?us-ascii?Q?02V368hMPlY+lktcQI6eH0DwQgMiOR7ya41gqMfNCwRk9OwJQlJf/wcHCeGJ?=
 =?us-ascii?Q?/fRHMJJL535fKbm8DLAal+AePpwXVzSQLppVWPO7HRJWPCMR2L1zjsBeSHKW?=
 =?us-ascii?Q?ddAiCJMpXHTM0Np6cXEQ4TyeHzQm9c2v/CYB6XDtVY6C05a+QCexQlkZF2Gx?=
 =?us-ascii?Q?zbZvnnelecn0UOca2XiTex98F1z1p63ITWybV7pZM8QelfUgfNjjVKex3qL4?=
 =?us-ascii?Q?RoFkApCt5a3KkFh7dw+x4iRrq0lyuDTVIo6XZBA0CtGoc0ahNF+8vhUD+AgQ?=
 =?us-ascii?Q?HoOCql3rzoxwEBjqVDnXr/qWlhKs6uVGRIL9vR+VD8xDD+FSE8Z+2MPJobMH?=
 =?us-ascii?Q?CzX0spydMa79wFFE4QHlPOeMevGDVWGwHEIXShv1Wxb27QHYl7lDoj0WGCMO?=
 =?us-ascii?Q?iaobNFQ5nbcsC0MAfJOxklat71li2XtTIrsroeaN7058ZefqZ0aqqr0a1qoo?=
 =?us-ascii?Q?KAHytyvt3Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5dac2c-4ec4-4361-289a-08de8ad884fd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:28.3146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDONy2MmlDU3Tb5x+5rY0AcoaY/BeXEoY533yTZZWo0xcn3twUoYLaRuufZYfTaHwPSQ9S7DYc3Fv6CK2g5cFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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

