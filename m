Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788CA3F9F57;
	Tue, 17 Mar 2026 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788069; cv=fail; b=MAQ34Zirb4Un87I5PTd8VuuyJrOIjCqd6deQsB6swZAE9exvh54JhHZGHvP7xjjEMlSCB6UNkZjDuZzBqoRcrLD7J1gHlYGkvrvG8csPT4zD5knYtI7ywSI6seKjUo6tPZlhYoMchoPDh2KH7umCDJRNIudAOeblQJv1WkohsVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788069; c=relaxed/simple;
	bh=DgxK2O+y65ATaa48kI4pKXj8U7y35Un9j6nPTbiqtHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JvQLCIyJ7MmaXNLKqI4ZuEVd5EPmOoZLqlhMWhJm7fWc4+kzPqKyVqOGJSLxElBrgX3mLjZpgZngWmJsCEA3LF+zMkgPZqICcPLUmgOo2Zoo00g2SMxB24NMBa8ivJXGj7xiX8JE0eQbhs2a69VEo9YXxcxLaxeP+Vxq6eGpEpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r9L1WesC; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r9L1WesC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x227PBAL0r555ICw4qVwUAlwvfUjfM/EfAKgdcwGCmSJ4Td5/cviVk832Lhvf3d54Xos0m5dybMwCy0oM//hdsOsKi08WeVeAQ0bNhV4VhiYIGQdM0rPq4FHFxWOuF4laX/bCc/bmyvneuskSKq+ZU3ywoaMQlgnusgbAN8q+Nd7o6HviXc+XO3yekfwQivoqpVnQT/DVOXOqSDIMm1e1oGQd8Mot56mpXNQQKuPJKyskminFZV9/luu0GJhcMDgqoA2sD5pc8Ksn1DptUFR96rjpKcURebPtqqRwV3rtRTnuM7sY7jNpIJEmCRxMTEnM++HYbswU3jVaBbKTwKO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTsx70V0qdYFEfuvPC7b2bRXggX7lxrWj3DYMMvY2jY=;
 b=DfQKGR1o5lo68MBUYdPMIJva+PSSGc0T1FFrh016umeu+DByE3tWq1O/+8qtaonTe+myCJ2EPH7iTa9xTnWAJ4lW1KJ6HIWAHwoGyKME6wIeK4Dn3MT64ZYj6GRhiZcd367pTMMPMavGs3HwEXHuYKBoXgyvWOY8C9J/+QUamNbj1otGfaybvmrcdCxtChYVM1qJYn+lEczI5xde/beF0eb1x+SWVzKIOeYopZNo+VFHui9+sRVkuPTvjWxTxVKIXuAQmQrHZlOljX3CelS2DG6yQD8CsCqZrnuXk3KjOhqS0Dq05yKtvtSQazKnICTd9LPAsay5dvQ+2XdYXtgMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTsx70V0qdYFEfuvPC7b2bRXggX7lxrWj3DYMMvY2jY=;
 b=r9L1WesCqqpLcQw1kVkkiXVe82HVSsuoT1OOSWHnNPeWIGS3Eh+uYK0cOx7GcwbZ278JMaXqWfwvjCyKxDhjWQuFWxpcgFcvt5IzHs7hjxJVBenx8S6MN22Z0WPK1EYcxPLLYt+S2b96ys7UPJcBu5tnYBn4Rcxk3NWyZuuIz/EMoTwu76P98Oew5H8+IoZOwxhMPJfLD4wxHvB1TAK+n7xQmLCjsPNjhJkq/c0tHjC5Wvf8d1OHeuU0DeWBuvKUpKCwfo8czgJ2DnSLHqq+cgikwNaoGPet6zhvpqyDUUw0B2+WUrQuqU+vGHGX52Ue+vyynC2F8foT6a+uck1V9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:19 +0000
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
Subject: [PATCH v7 14/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Tue, 17 Mar 2026 15:53:38 -0700
Message-ID: <20260317225355.549853-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6249a8-6af6-4983-fe19-08de84781dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oqZAuyKXt1aauf02LNffPkxALQ2YI2plEJ1Bp24R4IGDTAJMikdu8IrLku0ZZt5RZZk46fSnyMoWjp4OP3aRWpcKnNcofsRFOEWPnh8Z5dZVaeJJOmaFK8HdimtZA+l8MlTjfaUTeh63OHQOwrfy/HGUBrErEbFJ0GjpAx+hXJMtQTZPEnc5bxznGm0OtRwCQ1TTWFFzQnGGyyzUyrYwvdYTjd8QonOOHTN21n8eB5D9ukqn7wXoBKimde4HG2YTCD09Rdd0VeklUiUVP59mcg3L0jkvUlBQTxIpik1S/wubN+B+bkcWDUkW4FFOujcijBn3xQFESKqGFUYtNcl8ihZFbXFIWZIVCCwGVNfbb8UdI3WqB2y6Sg/CJLEmmGRG2mmRLDwnSVOsjVHYw6MA0JrmZf1mrdoXUcUjW0EmWHDCBglO+6366Baf0Ou7ONzcpi72FXo/Gr2yaRh76q0cLR8TM0xBWI4LLB2EtZOson0nRO8RxsPXoZaKQfrzoW7eCa5Bd3mJPJwDJgAWBLVAiQfdgxlCquS42GLZyCY4WWCw0sV1PCqPQNVJeXFXIK8LvwvE8wGgqDkckpYCO2SRij8pShJ6JpL5IoHobVZutmvDCEp2MewMcC66rVVaJlkE568+XZPc43RObSCTGDKUvWqja1dwakX1a6T1e4JR0RNrtIdjJSebmD97ZqLUrpRuvl/VBx1NLaFpp9wnmCnQqPg5AGy2NlovtZIf1EA9l2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+CvnNNj5p69oZW6fXqhgy1jk2Hvb0Wh3PywzN/Zz6u1k/+wHLr1BRaQtbtD3?=
 =?us-ascii?Q?T8zyoW69aUqNoLTEZ4YdnNFir+P7Ywf2+9MK5D8q8rOyxn13hkxP8nt8wi0F?=
 =?us-ascii?Q?TxR/nxbNy1RbtdzQFLuXo9VQeGkxMNw361LnAUmxSjodApUf6yqLgnWUITdn?=
 =?us-ascii?Q?gZ4O1ye4ZMjdfeqarDy60jljQuGbtyAXrvWEmoN2t8XCqk1uHia1uay4Bp5Y?=
 =?us-ascii?Q?RH0AUHZTYQKfRxunycSPqvVmMAbtcAjqiSSHOA4BkSte5UR+OgOYpJnsPv4Q?=
 =?us-ascii?Q?K+FV3IKd5p0QnzloSYBOWusX3TgTc6N+pDbLFkVwq7GTCkyUWkltEcjOMVT0?=
 =?us-ascii?Q?a/GykC31iesumX3Unq5ffAqSzWuUhkT/nIJqY8DjJwyR3FibSDXY8w7VY+Ev?=
 =?us-ascii?Q?4bv933nVJXJdc5zLOt+tbcw0iCeS/YfpFuh9seoJ3RV1/IPBUzFNveyncVI7?=
 =?us-ascii?Q?YILFZXa3g6yxd/zeAb4+7Lqq0pJ9pQv70F7F8znA+muQfKQlam/sHiZ/iTCr?=
 =?us-ascii?Q?uRWEFVJHfEvPWxF8MopbUddiP55EGnlbnxeyej5s4psqU1TeFVQ2Fa7ChSNX?=
 =?us-ascii?Q?92eWl1RZe07LvpsuLG7FuPVp9KGX2O8EREtyVnZ/v1mkna6e98F9Z+NfoXzw?=
 =?us-ascii?Q?ZW6RjXvFx9GVkazwSKewI6tFUtNioJXUhSxZNokIuFajW65BnKcC4wm6EyUa?=
 =?us-ascii?Q?DaPwtsw52bCE4zjdv/OvhxxJq8p8l5L3z1xduL1VLhWBvtiXTK4wf9zPFfzQ?=
 =?us-ascii?Q?alOiSWDX6wjKG4nykg4uisnWNqfJiydtZeHCZhPkZ51MOUcIMW8x1FsH73F+?=
 =?us-ascii?Q?b15TQxJXpgj938Kq+nurZMsm1OVpJw4DjUyEyBt76xUVbdt5jXIpnDmOhcw7?=
 =?us-ascii?Q?dURpu973WccL5qO6SHXY+2UUlbHbIcMqoA0aAbk2Xi0J4NcvfJgojCSy+1S1?=
 =?us-ascii?Q?f1NGNFCRTuyk6a1toFSEmRVV2CtpCef6l4qjsEdX/41O0SBlx7UXurOFRgn/?=
 =?us-ascii?Q?/lNDKU8dlmK908oTHS1YvLsvzsE17ILb/HjAc3nCWKMWS5mQXiHYHjv2MzrL?=
 =?us-ascii?Q?Ux0aoH2EsF2JYQbceVU5l5UPY6s+1m8IT82fbfA+HGJ3jfwJc5iPlB9cgc4G?=
 =?us-ascii?Q?k66xtHFE2k68WduvUslIy8BL3Pk2vICa2keHelgXYIqe6B9O9pUt3TPgPXLs?=
 =?us-ascii?Q?doOzKrZx3V5AIW9gxk6g+Ky856FhHt200AdNVkJfMuf7x8+u7DqF8AAV73af?=
 =?us-ascii?Q?QgQcXkiAAk2XJn1eaAwTLLa7zFyGDMEebtKGgbj+JZlQ03HLXQX2Myq+p7Df?=
 =?us-ascii?Q?lK3DaaVMTZMcsXX6BYHziStoxw0Gi4lP9FtkVo65sjx9oTswQ/mgXH+wnCgS?=
 =?us-ascii?Q?yJfI/rgCp2Hes9ukyAh4SjGDJCEsO7NpGf8HOTduBEV/+ycbZxjdenNpr9TR?=
 =?us-ascii?Q?hfSygq6LNWTLPso1rgUQzyt/Cc9mAX+8a68Y5zFv7hhkf3D57kTipRMfyu/O?=
 =?us-ascii?Q?1Dt1oDqlslqutS2mdUJoYRt7izQ9pAEQCajzYX1p01GFhZH6RA/FwZLin7Sr?=
 =?us-ascii?Q?TRxY3IAdSQlxbFJe0YIN2G/xe6AGXz81v3gesrMZ574wOiceIJQmEdYKVP0M?=
 =?us-ascii?Q?ZHMxLey7flDQjmXYugxDyZamTOha7Tv1sDLSuAW4J15I1KTIfnD+JFaNa+Ry?=
 =?us-ascii?Q?EHijrp8yJIaXd0ZAXL6D1E96yI6lzgxKe87jExaQycRw18tQZN3BE/u7sy7g?=
 =?us-ascii?Q?gABlmrFDmA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6249a8-6af6-4983-fe19-08de84781dce
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:16.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bsx362c+ZM91ErpWchymVzrxICdLTiLECo9nCGSbukTA+w4kbbdSlkQeefTcBMN/VtJcW7LDhNdmS26q9q7kRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 120 +++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       |  12 +++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index c5ba1c2412cd..29a68d6934a9 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,13 +5,26 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::{
+    io::{
+        Io,
+        IoCapable, //
+    },
+    prelude::*, //
+};
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -28,3 +41,108 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+/// Maximum addressable EMEM size, derived from the 24-bit offset field
+/// in NV_PFALCON_FALCON_EMEM_CTL.
+const EMEM_MAX_SIZE: usize = 1 << 24;
+
+/// I/O backend for the FSP falcon's external memory (EMEM).
+///
+/// Each 32-bit access programs a byte offset via the EMEM_CTL register,
+/// then reads or writes through the EMEM_DATA register.
+pub(crate) struct Emem<'a> {
+    bar: &'a Bar0,
+}
+
+impl<'a> Emem<'a> {
+    fn new(bar: &'a Bar0) -> Self {
+        Self { bar }
+    }
+}
+
+impl IoCapable<u32> for Emem<'_> {
+    unsafe fn io_read(&self, address: usize) -> u32 {
+        // The Io trait validates that EMEM accesses fit within the 24-bit offset field.
+        let offset = address as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_rd_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        regs::NV_PFALCON_FALCON_EMEM_DATA::read(self.bar, &Fsp::ID).data()
+    }
+
+    unsafe fn io_write(&self, value: u32, address: usize) {
+        // The Io trait validates that EMEM accesses fit within the 24-bit offset field.
+        let offset = address as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_wr_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+            .set_data(value)
+            .write(self.bar, &Fsp::ID);
+    }
+}
+
+impl Io for Emem<'_> {
+    fn addr(&self) -> usize {
+        0
+    }
+
+    fn maxsize(&self) -> usize {
+        EMEM_MAX_SIZE
+    }
+}
+
+impl Falcon<Fsp> {
+    /// Returns an EMEM I/O accessor for this FSP falcon.
+    pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
+        Emem::new(bar)
+    }
+
+    /// Writes `data` to FSP external memory at byte `offset`.
+    ///
+    /// Data is interpreted as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            emem.try_write32(word, off)?;
+            off += 4;
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data`.
+    ///
+    /// Data is stored as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact_mut(4) {
+            let word = emem.try_read32(off)?;
+            chunk.copy_from_slice(&word.to_le_bytes());
+            off += 4;
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 53f412f0ca32..f577800db3e3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -461,6 +461,18 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     8:8     br_fetch as bool;
 });
 
+// Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+// These provide the falcon external memory communication interface.
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    23:0    offset as u32;      // EMEM byte offset (must be 4-byte aligned)
+    24:24   wr_mode as bool;    // Write mode
+    25:25   rd_mode as bool;    // Read mode
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

