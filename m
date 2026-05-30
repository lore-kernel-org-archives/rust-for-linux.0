Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A3433689F;
	Sat, 30 May 2026 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110638; cv=fail; b=thTCO110iXGH703ktaChF1SzjbJcCPJf+DVT89HwvKcy7rBeOIB8Y/2UNOATefov+5/v/OsvljQMhXTYoG+zTsq/4sucDRBmLgDPqKJ5U+RfmAoKCmSx0D7txFdVbrHpEh6xnaEBQZhJYZorxTPMRGLLvhDERtBaZ5yWlPyo9FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110638; c=relaxed/simple;
	bh=29iYyHfInC3eoTWQwK7iliRaIO7Xkz4c1qYfoMK9cUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iLmZI2P+/ncOqZ6DAj1pLMOyeqJ4RRZzpwezXqTSK38DCOTgS6dTJgPdwHf9czlttNNanp4NJIatJpoE7vmWSwE2e7dFFIOvMVDSVG5lR211GD8FuffzQkEZA5X1R53j1CwNBwWbBD9KBiQ2q96IvyLM2tGZMQ4Z1GLt0Pb5wHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=awb8cps3; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="awb8cps3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSkZAOMHZNgz2V2K5JOMLk8LFgq03fxdQYWkkaMGJnu8hF+qwjMH6wUR0NaXKvlBo5VUFeK6URzTtlmHAX9cjMDJzf2xhCNtJBCG4jlgPB9C1iqMnEta/DzE1MrGdFeRabdw4dipMCbdy/N/jvjgeCMr5/iNlPx7FHzly4EjOpH4HC+Z0Wl7ntsxojcJ70SuGm+Inen3Cup6/7ulaz2HRntHsvlV4OVjEFdmY8Vz8++GwhdbwZgTkIXGdiWnMf20Icb/W3Bw4EXSOJU3d9HtG/pzIxM+a8VdQ/Tth7mh0GwKbi+XzdfY/b3PWmY7I8cRsYGoI4ayr5Pf7XRyjLntiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UggvjqSG5v+1De6KKtEtxC1q99mYrtLclcTXAcMypVE=;
 b=RfPNN7Oe7Mt/d/8K3xs7LC19sBEQzl1iD49p108o7mnesrBNHPUXkU5ZsOVGcKuvaPx6x6Qqob1+YWXNv1drH0dVqS4dhTDT7mT+/Bu/5nggR1/vxz8iW3Re9EmVhMERqKChlUgs8aTgoqtIUIMtR94DA9vlpthmFZXYaVzlm2vbGQXnuTv8mWmTUiIshiNx0yzdZ0+aNayHEYk/THmrsvTlbPq6l9e/9vA1LDhaOIipg5jQA+U6VvSqqs9+Tg1bywj/8i4OsaB/gqKD8WpF/FrZ19yLT0tfXYVj9h69NSpiSNuX0b/2aIYmfh73TCG7Qr4V1b2T5JdeViYjhw6wYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UggvjqSG5v+1De6KKtEtxC1q99mYrtLclcTXAcMypVE=;
 b=awb8cps3QWKaNNcczrkTq05iFHxHQcKyinQ8f3Udf1txrtGwnAwhEeZBR8Mk9FnVhpAvVLfelZGY0I8+heQTUTDSGQu/zlNkKsHNv5YSkOQadxfyDB36zjJnyL7rLVeTzoRLOstcua9wFqCHQWDsHvKYxQ8J6MGBgUoTSjqr7d9M7cy6qVK1aL0jvbTETqLtJQ5QegZVcCVFIri4+/yvvhS8kbODUTA7/MDxy7iz3bS/JL7LvUgyJ62B/E+ToPDb/bqRYdKAfXucU9R+kPpfuhPlmjmmQdWR7bi7tL6TmfDiXpo1ye+TnMU4jAfQEs5i2UJOMwpNEJZmldMVfAnW/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:14 +0000
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
Subject: [PATCH v11 15/22] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Fri, 29 May 2026 20:09:46 -0700
Message-ID: <20260530030953.740561-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdb854b-4328-4739-2f70-08debdf8f788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zQiy1ihaWWj8pIizyqTy8w/l+EzVXKePpsznAOfmhvtL0LgFmQhZ5y2vVzXCjRQ5Cx88ObXHxupa8UFyTPavcPCORlCquBpf4oyhF2qCAKip9YisuX60o1Zo5a6oezpd4629taN/hhJTl1oEeZcN2uOVgfanWV/9T7lRzrym3e+LlodOayAgF1tyrFaIM5YGM76wTYt7xzIUpIhjU5m6ZnVu9hkgHLOxgTf8hIRLZl7t4Xc2NN6UUFroj8dbJls777oF4VW88KebsOgRkjbFDEZFRiqwfXvy8gU9w8Bka6RhKPxQvIkOncMYywV2n23y1TKe5tvXzQsgWsZt3k1yT4vy/P2k+JRsV2CprZBsQ4bURkuvmNkbjxTLxhQRIkN2FykVggiitYME0ZNUErsD8bphwnihku8qWNdRBQyBzunCRdO745HHXzFU6TTnU4rbSStLv2GfORa3HYmZcsO4wdUnlT3n51NqohAmSO4sVTX2qsdNKwyidoguexXgvEZ4ZzsgwZ12wVqVQzAdl7pAULZDmZ5TzDpjUWh4r27fiR1j1nRIuZzcLOEYu0mIqeaGwX2huP/zMO2oWE0WHU9caZN2OTcxzTfyVZu5wok3XuOGLWVGQ7ier2OMMno2V2j+irOaJ53o6r2dJoBpKElHP12pdKyWmr7t9iCbXoPa/8EvBZwXFv+m0PQHR8zTC0qH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CfT6J/1YZ9Nv4Rp6uHZ8/EDBoFjlIa5V0q+t7zHjU2JwS/e6e/nU6RXLdfyd?=
 =?us-ascii?Q?gZXErw6MhKYJHiSvL2eOu9UI6AEKi+hu8ijKvwMp3JEsvid2sVepg7YcXa6w?=
 =?us-ascii?Q?AjRs3J4DcRQWHW5ixwF8C3H5oXLl9kTbbZsimg/1R+lUENEfif7aXmO3OzDr?=
 =?us-ascii?Q?rdWr3q96rXPwGBfgygsPON390QRrPl7IRyN1PlhTtYZkZvkvnvBRkDc7ZWJh?=
 =?us-ascii?Q?duGd+SNToP6o0Qhev0ZbfcmboP8LsLOu+/ruJ/GfHmNddoN0H8RxB40a4vUE?=
 =?us-ascii?Q?xRp8/k/18qnnmY/Xne4Vd4sVIZfVv4mvd/wDvyOx7dzxx0JY+3Jur8U+nqRL?=
 =?us-ascii?Q?ACV9Q9D31Pb8LdP2o4ehhdmnVvRCOgGSGdMC4FRXEuZw9VyALfxTLzach7Bb?=
 =?us-ascii?Q?H6BA/S6Vx6b7Ntj/dw5QqPNXJ+ojoITouAp9O8H+DnR4u2Kl3ZaM+yWtJEdD?=
 =?us-ascii?Q?TOGMI6wikze6N3rgoe4Al2/Yx0Ix19jaj6dLnkQaHa/c9LdCer10UsAzdvIs?=
 =?us-ascii?Q?82+a1AIYIH/OwAYO/0MLyC5lz/ELziZrTfdaCjzOWq57rkSdDrgeL8h0ZUQG?=
 =?us-ascii?Q?hYo3+PpbxvWqFo65q1PHYbL30cZfN/DAAZZ0BB7RkbiiN+4aXyoyt8qCpLv0?=
 =?us-ascii?Q?yqYvYRiEI4HlCxoJ32Ol0g4XIPA4zNgwVRhPcG7NJbiWlaLE4jI7jRFRfKtb?=
 =?us-ascii?Q?Cga9t3duCnGEjO/rXCaw7/VnsehEaOGwkWs0boQ3VKkk+ShmzFt3Nm74POQy?=
 =?us-ascii?Q?6btGuSrlbiA7ef5TxHTb9+rMXu1rBQn75pgnZ6EK9viVX02D8gXVajYW8Fij?=
 =?us-ascii?Q?8BhrqX0JLP/7urKPtZ+vgCGMFThi4VQNaE6ndASOSeWcNo3scBNYbKROK3CK?=
 =?us-ascii?Q?9cYl/p+xSqb8EMx8nXD9H1iaeeb/5UctQ+tybAWq0ijiGmsEq8W9a2xqv45s?=
 =?us-ascii?Q?0jpwk6TwZE2kmmoU+in0fvq5LHbXEMOKp+IIy/laJ8yj5pEzTAQVE4hfD6gu?=
 =?us-ascii?Q?YnKHcjuDAR7Vic/2uab9nGiMEVr3upBvYSdJMDdsIqo5+ssc6tqt7iUdx0fD?=
 =?us-ascii?Q?Zh7l+dDAPmBHTLRAX43d+aUwpfUotQm3buCemJDgO4gw4JTgqNnXqIxT3xTc?=
 =?us-ascii?Q?hYhK/Vqs+FQIxsU/PJTFA9CSSKhaW8f+W64/cGvZQVTODby1sBRproy/PfLw?=
 =?us-ascii?Q?d6fQbgs/QBMXWG1MOJOzkmxygMWE2SazRlWRzGy9uIHdXuKvOn7Qyibb7w4U?=
 =?us-ascii?Q?qU1dc66xLeLDF5Fj2C79gCd/yrVD2sjkSCMCZ1SIgdm2ozk+rYirhSfUidQV?=
 =?us-ascii?Q?F7SPF+aVQlKVl+T2iM0TNx03/ccEq2YNlfcF3FssH+qEyh1WFmxDDjxURsVw?=
 =?us-ascii?Q?RV1dVqo2oDdCtS3CnIrUD9IkXiDSbd/nRoItw2oSkiqRNjqelYgla3BMhI3l?=
 =?us-ascii?Q?hogElQBhaG9LNRCG3k6yrEttIODq52VNUSCn0P+HWkjaBmzh5v07v0jFHvVj?=
 =?us-ascii?Q?+Fb82tp99tPUSVR0z0RpSx+09PuRK/hNZZLuLiETA1pHpOu8tGXGwpKILIY4?=
 =?us-ascii?Q?xXp6B3dry6llEca9k/inH9bqYE1eIT9+7GbbH6HdZoWxNsJtyRk9sFBXAtvH?=
 =?us-ascii?Q?3aIniJv0SO1oTgbTPbZkn1Vlwy6oQuhQL+NGPJW8iPRRqEC2UC7s4BkS9ZEY?=
 =?us-ascii?Q?BJXoLEPxehORuGS0hlSXs/gDAsxGz710M2lLWzm7i3R+HOKtHp30JfmWbBGZ?=
 =?us-ascii?Q?Y8ucYOJZBw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdb854b-4328-4739-2f70-08debdf8f788
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:13.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fJIkJQ3JmwJL5AGxl7bF4cHU5M1wak1vTMpy9Rgm259xrAUAwJV4hSfYdF4yy47wr9cRr2VqLDjzkyZkCiGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

FSP communication uses a pair of non-circular queues in the FSP
falcon's EMEM, one for messages from the driver to FSP and one for
replies, with the driver polling for response data. Add the queue
registers and the low-level helpers used by the higher-level FSP
message layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 61 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 21 ++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 7067c1963745..57880c4289cc 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -112,7 +112,6 @@ impl Falcon<Fsp> {
     ///
     /// `data` is interpreted as little-endian 32-bit words. Returns `EINVAL`
     /// if `offset` or the `data` length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -131,7 +130,6 @@ fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
     ///
     /// `data` is stored as little-endian 32-bit words. Returns `EINVAL` if
     /// `offset` or the `data` length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular. Pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[expect(dead_code)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
+        let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        tail.saturating_sub(head) + 4
+    }
+
+    /// Writes `packet` to FSP EMEM and updates the queue pointers to notify FSP.
+    ///
+    /// Returns `EINVAL` if `packet` is empty or its length is not 4-byte aligned.
+    #[expect(dead_code)]
+    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers. TAIL points at the last DWORD written.
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(tail_offset));
+        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0));
+
+        Ok(())
+    }
+
+    /// Reads `size` bytes from FSP EMEM into `buffer` and resets the queue pointers.
+    ///
+    /// `size` comes from `poll_msgq`. Returns `EINVAL` if `size` is 0, exceeds
+    /// `buffer`, or is not 4-byte aligned.
+    #[expect(dead_code)]
+    pub(crate) fn recv_msg(&mut self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        bar.write_reg(regs::NV_PFSP_MSGQ_TAIL::zeroed().with_address(0));
+        bar.write_reg(regs::NV_PFSP_MSGQ_HEAD::zeroed().with_address(0));
+
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5871bbce7052..d4067efb8772 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -568,6 +568,27 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust.
+// These registers manage falcon EMEM communication queues.
+
+register! {
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32) @ 0x008f2c00 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32) @ 0x008f2c04 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32) @ 0x008f2c80 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32) @ 0x008f2c84 {
+        31:0    address => u32;
+    }
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.54.0

