Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468C839B968;
	Tue, 10 Mar 2026 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108722; cv=fail; b=gAF4dBGrPsGt6Zrj8th/LiHUsRPQopdSYQytxwWOVr3HZlgmq1wim0I0NY1r4EoUdP5tcunTAJ7wsNJROI2B8kYJtv5c+5dvEmwrvMTgmGfTGJ5tU8DqVngFoFIXH2h3tryhukR9yRBGKH0h2l34T2x8ytCG6Pof0My/p6Yv/Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108722; c=relaxed/simple;
	bh=54UOkKSU/r0+9HlN2WqD7RK0qDyrWgrGPWuDPTP4LTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q8NM/G9eFlcz5BZgJjxSUAEec9C7ezTkUgPGsxvkcIYL8seGKUo+mShfITBgF8F7Lfgt1WlWH3wzN+Wv2fLHI5rnZ+U6qpEXcthKXXVD7dUIt+nw8Csa97pR34rD2TJ48tM5dB4DC7kwd609meWM9TjcLfqeJvCxi2geM1r4EtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SNKbLHbu; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SNKbLHbu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDKXW1G9zuPDz3gOi4LEdDKK47cVGJVMaMnllKBVRlDC/7uxhx72k9kd8FAlEZl0+lhRFPk8nWrcwD8t+1NxlkGz/jS3U59cs3/7CUCqEDkxvhI9EVzrZ+jx/SilRaTAwh0xzsVc6TKe0DcKHROO7zMg/pyr587hobhLNWqPNhOwYFZ0XHXFHZhPMHZtnzHl/ZvH5HjFHjjcb6rMjdkxawrItb3HAdmGe+pN0cJewPOT4EWxaGN2WrRx2cOwmh4pFDP9ezWC1jY/SJUZiFmnD6dsO//Q/kQwcR4m5FztyNdr0zjTBcoc9T4LRJEw3ifiz+0aXriMIz0lM9ZVzYAOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybQZ02/Bvk4jx7ngqj5rNiDg6bqLkTxaRRGIOChoc4U=;
 b=ti2X3FsgQPOoskYMPJuW8N4qtWVz+iihY/RgVjEh4BYI2ObKseWHWtkn1w1wXqWjnCumFniKxZ5AGcbucxWLycS+U6OqXBPJ/eVCTGYnppmVkRjfZep/BEUGtQ7+pOt3Xt6fZmCqc0+fYr4Xa4P3RTDHPVN+F+wNKJoMDxGtA9VoF2eP5oasV/9Qsm5qKVm+uHi9NspbqKbeM47XMn8mq7/hGV5g48q16UB27l38BRY8ArTIkVIsIem6zWqhGZqgFzTkWV9Q/P0fx9V7hTd7de7rW6EG2b3N749nJwJgf2RVbwLmjfUnQZiTOlH1E8+FYYoMJukJY9mYuWoRtZKPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybQZ02/Bvk4jx7ngqj5rNiDg6bqLkTxaRRGIOChoc4U=;
 b=SNKbLHbulxMlh+McFiLlTd6xzV1l+ojEHqlifzxdh2gF2n1Z5LkusoW5WpS/v48CaTNPoxqdgCn1PmfA46RRGTLS1nnuA6Qlt+0/+UNrWXj3hDkNe7WzYZnVvsDSUuL3GS9ePP/sDXECL7vwzw3U6CIod7RSNS6HgfmhIyptUvcLy6gqCvuUi6HolslRFYvesEDTmfhw4+Vg/Wsn7CBwfuBkBjdSbyL/m0o1gOrfJoXlBx+VcTYbMCqCHh3T47K2svIocX9Btv1kdSS9+kRWA6lR0483ZTRV9rvRd/rwg25jA652m617O6rZE4/OSThUgT2DwTro3fU/1H6H56w52A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:51 +0000
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
Subject: [PATCH v6 17/34] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Mon,  9 Mar 2026 19:11:07 -0700
Message-ID: <20260310021125.117855-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a71b66-b9aa-42c0-0b11-08de7e4a6437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	GNgg4XFSw5BHMLXHjR79mZfrh2Ihib6ZDXlVtxuhQke4STRCt4Wqn4enyb+NOOoHpAaGbXHsba0TvcOsA6lzihgz5V5T9pnbVWIMTqOyINROqU0gCZ7dGJqV+Yo6F5AZC4vNOF5aTmV1gTTKAa043A43CLmS0jt5FdZb89/s0hVSEpGlpnzFc9AuDSvE+EbJgoMJ+RHuRJzZmg6wjo37Sufl9hFRCUvRzXa5mj8QaXpk147Xmyw9GSl3E2lEG2J9X7QGieu70JL1Lsy/wlFCmwHpa736uF4yknFrcNaoazClScguofcW4SSSphKtSovVdHqazsal4afYIEwpU0M2FqJEZUHc4cx0kKsTdfmD+TVEuHZb4q+FH0cHrgs7h1HSjWhBMhjmay2DHZyZXXacsOUSLyS+ToAxvW18umv3RidNTpRcyCuMz+lqruRBGu+QiBSFQIc6AeToyURI+QMC1kCo70hu70xquofqKzLKopaFJgUTIZd+Y/vdeTkvxbY50Ely1DJTlHkOm97cLV5Kk4GGZLTUyQo4Vp7PX7ynHKusj2ZHwnjwSfQktbUvVZFmPaRVAtHCRP/htefCafGrzLXst6Jcok0erOLhw81zGYeylHGMocz97p0S3RzaGylBQAv2yz72pHgVX08CIknjrKLPXN/kTHr1yjwE7xwjCYSoIvOtki9SkgPAbYlnru5x1KHxdTH9W/lFSt65xzxnGdODCq3LkE8J45iTQUCnId4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fT9FY4PVbxToVV5nbUh+nvhpvpBmiS9HaqE9jCtoY6JVg7ox6ejWrYX84um?=
 =?us-ascii?Q?kS66stme9BCNZYz3I0XMGWOKRdKlxtwoknms51CwSGtyd/HTGSzm7scfR5/c?=
 =?us-ascii?Q?LbxRqS6avkwvAH82R+yE759fkTqzpksdBysYr6cl1Hzhma9eMneTrcPHqsxu?=
 =?us-ascii?Q?G7+3Rbwc34rLB1Eo1biET3KFpbpcRV2xhPx6dnBjY9ldjsvw0oJUVS3PlYdD?=
 =?us-ascii?Q?Pc5YhSKHquppOL4xdxHWbr1PB1/SGZhEEO1xGoxpxXpLpmh7d39x4t4lik5w?=
 =?us-ascii?Q?riI1J+wg94qaMTJ4eXIXVfl1CDha/3nqlZaP3GPT9H3yeuHrSkOUGOJh7Rd1?=
 =?us-ascii?Q?66GIMypM1MQbJxn/fqmFa3PP0iuX57BUcGijaBAwVXoO+pU3nsTcXlhQCTCe?=
 =?us-ascii?Q?jcWYUhByJCLw0rzJ7Yn0keZRLaKYvKoSevdl8f4LqDHZpU0xi+1vLGbb2w7P?=
 =?us-ascii?Q?yXIQTUVuuuJ2PQ1SYeYK3jMqRwXVjvHS76uanQcCkpDVvdTkmzLvh5YomF0U?=
 =?us-ascii?Q?IO2L8eN0uYRkrIk63uLKNAbACGp960OFQ0/EiTA1+U6TS7bL5iwQ03Xv7pS4?=
 =?us-ascii?Q?de4aLcuktqxq7GR1uo660pDXnQjoqtQM/+YzkxdjBx5TdPbOogNUakuCoQw1?=
 =?us-ascii?Q?mMia812AY/6Dp2m2rwNhspau8eyPnVJC1hU41r3kgJjJeFZh51lu0wCJ6720?=
 =?us-ascii?Q?SX9nViqJM343UVSO43k4ff7ZFyomodYcf8act8rV/HQ5FErujaQTyPBR41ad?=
 =?us-ascii?Q?Ty3Ivr57IqtSGfqOA9kt60wz/UK3CxWNukZe7/fzlKUQvG9n8GUZrlkpvIQe?=
 =?us-ascii?Q?wuKyXdQpr6eTC2BiWTagAgkKBYjrCQCY7rz+fBF06bjPAXDxzqv4pTIBJ9xJ?=
 =?us-ascii?Q?P+LuBRysGa3TqcLmn+7IedNHZPXjjjbdmxsFQ5tEfxhg8cxg3T2CKZ7WmD4G?=
 =?us-ascii?Q?VWKMHJEZWO3xpiFbD8bQRpGWWQNYKNhJnWOzso5aY2rcoKSCboVI+g3EmWX1?=
 =?us-ascii?Q?HvJ15aQ5wYw6SRSzcZ8F9VtrI9kQ76ji4/6PplyQwUeWKDzjDTU22gCnsOlD?=
 =?us-ascii?Q?dOoSK/CkEpA5WomqjfWARJ84uMrA71gYvSC8UUauBkAPp0e6uIcxsCGG00bT?=
 =?us-ascii?Q?L5WMLOy/CYnhUyxMULa+z5RDcmpAb+8QxWQVDZi8UXe134WdNf9+n+aAXRfW?=
 =?us-ascii?Q?9p8YtaPcDbsIt+o1NzcR0/f7SpBVRy+2+5S5/52DKQh/W5DwP2win+U2wvEb?=
 =?us-ascii?Q?XBjJTZrKtZ+sFB6I3lhN8u0NI+qL46oTlnNcG0rP409flmpxK8dSGUwjhhHy?=
 =?us-ascii?Q?aIMI3s1YWC3PxPqs6r9Cw3nxm/byb/BuTMJCm82ZSL0iUKQk3FeczD9MeS0u?=
 =?us-ascii?Q?5jGbYxn3DBWz1R88Yn+CwhG6TWuu3aKRrQH3WGN7pS6BJgz4LcksHEntEEUY?=
 =?us-ascii?Q?irmH300PRnJQVPeqNus3buZlKwhg4vlYrAPIuAvlvoUoR5X33V3cSFFGIahi?=
 =?us-ascii?Q?xWdm9M5HSu7MFmHRB60C7oLEFF8156b/JaZ74LeAThk5T8zzvqeTtK1Amj06?=
 =?us-ascii?Q?euqmo7OCx4zmXp8uP+StPzzbX48mXEF1vR8rb325H+mQGxXtXdXn+v+H966Q?=
 =?us-ascii?Q?hK7bZ8C48NQnTfmkfaS5JmaQRG65AnB2EORDjeDapn8yTlP3c2x5SjWUnWYI?=
 =?us-ascii?Q?N2/+ddB2vmfNRQEvLpVRr7t5A8iEsKlHxnuTI9FY6s8NxpYsxvyiuha3UUal?=
 =?us-ascii?Q?ovuLTR2kkg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a71b66-b9aa-42c0-0b11-08de7e4a6437
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:50.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVSuvy3fbyAywsyjxY78PK6yZjFVeCi89mBwx0rD//nNTze9JGmmXGSp2mtE+9ADqQP5Pwhys+Poo5EiCmMTbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 122 +++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       |  12 +++
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index c5ba1c2412cd..4baeee68197b 100644
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
@@ -28,3 +41,110 @@ impl RegisterBase<PFalcon2Base> for Fsp {
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
+impl IoCapable<u32> for Emem<'_> {}
+
+impl Io for Emem<'_> {
+    fn addr(&self) -> usize {
+        0
+    }
+
+    fn maxsize(&self) -> usize {
+        EMEM_MAX_SIZE
+    }
+
+    fn try_read32(&self, offset: usize) -> Result<u32> {
+        // io_addr validates offset < EMEM_MAX_SIZE (2^24), so the u32 cast is safe.
+        let offset = self.io_addr::<u32>(offset)? as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_rd_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        Ok(regs::NV_PFALCON_FALCON_EMEM_DATA::read(self.bar, &Fsp::ID).data())
+    }
+
+    fn try_write32(&self, value: u32, offset: usize) -> Result {
+        // io_addr validates offset < EMEM_MAX_SIZE (2^24), so the u32 cast is safe.
+        let offset = self.io_addr::<u32>(offset)? as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_wr_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+            .set_data(value)
+            .write(self.bar, &Fsp::ID);
+
+        Ok(())
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

