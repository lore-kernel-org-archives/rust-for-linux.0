Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C372E62B4;
	Wed, 25 Mar 2026 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410803; cv=fail; b=DfeswtuBdzcx4Ql6PQGFHd51zWZWroN3nsk6WN3HSjC/2m7CRq3ZrK+M4LjFkqe+WyCwZd+7Y1bDnYG6e6UJI5DmhnuKifPRq95j2WZ3evft4slG6/xMpYDZnlFg2Ugh9liXr5BwEtCAcujas/BDZqUdq/Xd0FR1yClxe6Ei0JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410803; c=relaxed/simple;
	bh=Y+ZtLqq7J8whFXT5LYWtgXNdVtnTzOYrvFGymmehupQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jK7mazX1BWwQ9qsAhbVA93j5E9q0rGrnts6qQjdTE+UEqZta1jIdkZIdVznHscE67BKL2LB8jILnwvxiCZXaSEmsWjg5CNnFom2HHa9NdYcER+cahG/mMmwFzweXr+sMC6L08CMndj7YvNmUQzefuNZhPuuYPMlyAGo/vH5dO9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XLf1yGn2; arc=fail smtp.client-ip=40.107.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XLf1yGn2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+G7BtQP01d1r8KmQZc4AVrAEZnxO2sCC/Qy/HZOtjhy7tz6OaEVejUBD5CZW7+r6PfmU1TlJ+O2NIHD5KRdpo1EgJpLB4EHzmonTKOJPOKF416CW7pfbocJo6BT+lah+/uag6jl1bvalP0fVi9rpFlI2BO9lyPH2HhE9WUtIJdOYtACqSu+DrdGAtSGP0OoUQAnFajHc66CNnNiiCJHy02UXwSmK69v+2wyU4Bn9DS3Vbc+2QCWIZ8rFb4l59sYkhKjhgHt4wEccxQK+HEwvy6IDl7JZJSEwOf6XghIUJEyPY2ySF4Vs/e01/OS+c+Qn3v4VPPWr9qG5yYLPAzFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHkl2dKvNcuDwvBpcOmW4GVNZwqaBJjO0RYPAZF1Enw=;
 b=FhN/uJILh3EiB28PyQZPe+7Ysfgn8tdZNR9/kSYs1/AgjY9cRjY4N74TK8iaht5sIby7ao8zPqbhpKtYUpnuG5m5DoqBY1qN13t/wtjKdKhklkaa1o8/0kDDQ95iLOOtlIBaiEzfT1hWChDphMiLuELGmJt+PZkwzW4ygtlE6KqiA625nMHN0jqWE5r7mCd/rwSyY2vzUUKpl+EQQhGKw0D0CBsKfGqPHM8V/RKftxu9Lcw3iFNJXvTktsi9t0BjK96bYevqQpuPDGN+oAa2vzkcPx5IlzmmNVm6PaDh9UjGHif4crjpsVU3t3DwykND2eEPqGnimhH/RLmnm3MIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHkl2dKvNcuDwvBpcOmW4GVNZwqaBJjO0RYPAZF1Enw=;
 b=XLf1yGn2Taz/qJKTc3rjmHfKXQ85+fj1Xe903oEHgp+fg5LYcuTi2vQbwQeYKK/o8CeFe4vLi/NyPhG0U4Vb0Jd7kk24lzceonsptxzG5st5B0r161NJJ2PbtTEfsta4/mM5+GqSITuaTnLoqyRml1JNqOrgtk1G8boRoNEZw9FUz1qCqKrLffhnqo29sBiiJJ4dZSnDH8n22Dibatwb8Iy7WA/M919tJEfipdwGoAQsDIk5NkVprA2O27LeUZdolXMj5E5uf4Iz2JAXEIEIk1k9O7AwFejoOnkdizA8QhZJ9rqM5wFKg5JofV+6r2t3R9TN9kxISED7uW9jecU1Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:02 +0000
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
Subject: [PATCH v8 14/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Tue, 24 Mar 2026 20:52:25 -0700
Message-ID: <20260325035242.368661-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 67699067-1ccc-4300-adf4-08de8a220347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9hsbNrHmq8XS1zewyWMUJogzUjKvGnxrlh/RrMI7eV0NNftpwz/I7xGjFZSBQr2q3Dndca45CB5Yfvp0LW/8JCyO3QjPG5y0Wl75WaAIAzxcCaCybT32I8NE/he05N17z2V+/Cm29YP08jylLpRmb4ZEc05lKc36Ww4m5Q6o6QXmzPN860zBJeXCAai0SuhNqMHo9bDBySUCZJ2UcqIv3mbGXEV/jKHG1uHVl3KvZb7Ae3/fhO8miN6A/ZgpFocUc19H1UHnc2g4P1RI/Mt8ubRMMKS/YuRzbt8+EsSyFpLjR80nYv7hKXIWgQYJHGvsqShcGJ0/Ka/C3Ic9Dbl4xecRtOIXvfPVd62OzJEgxUIta2AMt4iQHfw91HRcwamv0cMvR9h09eof4Sx1/uHGpjHu+/aEXWfXvZH9dQdZUhRWC8phGAeaiMdtQ2qHunVR36tpDHUZb+1gG7uqEC7fy+O2Q8hkxaExgrTpNAT7oemYaKxjQAYGvsEOqZCvji4QC4WY5O+lw1ztz1gMN6xIlwnHFFcZKKXUloJ9bwuYlANpyzd0qMiykGYaHwbD5h2yTslckk23Eu/nZEgRwA3NA/dzAmUARSJLsuOJd5eWYfGy36ucuBZCXX/3vyMhxoc639zLMTCywUciI2VEvYORCJqPTIi0OFMclAbMnRKknvAdKTkjMqi8XbCMJb61yBsUMVLetuM6qXU5cxpcEziiYfv5lrcPFPJnFDZOjTOp3Ng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JZ1aMKK2MB5k92v6Kjy4jqGhAe5GH4R79nsj/CBCheUhbrHQ/SWM1+52hUFB?=
 =?us-ascii?Q?WKra66y48EDE4OaNvtTBU8AdKvmohwsouhwik8Sp+cKl0bGUwDo1H7GMZzwS?=
 =?us-ascii?Q?E1qLqpH9fn9T6NgxX6dSpqFTHqS/xvmWJ2nWyUW16Z/5Ol1RlOmPMp5qnel6?=
 =?us-ascii?Q?zheQUtvfkK/ip05l+KDrk0RKW9vjsu7E6G9o3wL8FWVVBQGOA7SEZ5Hxb7rM?=
 =?us-ascii?Q?+jBdUrAPK7khKF1j9em1tyZTom1MMRHnmaTtTHoLDG9lO9EFtxChv41Bvdit?=
 =?us-ascii?Q?vhu2V4a/ApCAF5mH+MFdrq/7RjNSp8KXdPxPOrZq6/oKlY6rZLcud5udn+BE?=
 =?us-ascii?Q?WDnjBiLlIrcLNfoN4dlqQ9lxvefN+gratN3Vxij2WSvHf2vCS9GqaxkdtD1d?=
 =?us-ascii?Q?tJvDHRCfyQc+VxrekBkyoeRK2XBrGYWt4FzFcHA3T4ERDbaZYXKYdYG+H5vw?=
 =?us-ascii?Q?kMfu3WKj5+PGuj1CV7bJeOO0hxADFKBjPkbAunZZGHG5bnqRH3YpzWC0u/r1?=
 =?us-ascii?Q?NeCbQbXcqpK6NBaU4iFYb5DTT0CxtBh0CD2demsWClSxxiW+aHtxD6GThmrN?=
 =?us-ascii?Q?3IX11gCs5rcbmrJuhNmfopoqhAKPxbanPLtVJNtcVibe1zX+MRRVikN2Hloo?=
 =?us-ascii?Q?XCrbL/81ATU4UIZwAaYtmjCLtXivtfuyfhX1A0ZoA2iSzLwksN5mFjPgtJWg?=
 =?us-ascii?Q?DG4xetgvLzm0DHoVnH3+Mkz0OmlN53oOInvS8Ytt4ZzDpX8hXZxupEeLHgCC?=
 =?us-ascii?Q?jJfEnGyETdFD849LOlJCsnqrh/oJpEd/4PbvErHwzXXDE0ATRkEvjQ3phq79?=
 =?us-ascii?Q?wMHFX5mABMPQ04IsoBV9fA6e9jUbtegLc3IxNUnSeU+GuF343IhxdKmP4m3I?=
 =?us-ascii?Q?wzIUSXpqVwKdTmkvmi+gGAqQiIC9XAH0SBUrlXVSOyW/DKrElruM5ZxQEuUb?=
 =?us-ascii?Q?K2sjYSNQ4ZBrYaEBN0nwIzceHo7+JX3/xVb126tvRL3Q0Hzqptyl+HJAUCId?=
 =?us-ascii?Q?+UU22KfGxgu3DX9X9luHfG39uKnN7YYrD24ylHqdwt1olJuvX+TKq3+D2FRI?=
 =?us-ascii?Q?8E/eD1GTq7KNOwElXVKm1+jGT8L4A9rhDKJw5awqvfXzRIl9nQa/RryOdz1S?=
 =?us-ascii?Q?DY6TblfhA+OCVcqu5R1IIpAXzgAQcnmBL89zjZNZFrKij5aK4PNqH8j0YzIV?=
 =?us-ascii?Q?UHU5qwpDMEXXeMfjhVLBjxY0Tli3Tm6qVGETgJT8hcOlTXxjz2CpjqNFLdS+?=
 =?us-ascii?Q?H4cyFeK9pSpFQPRbt4+dc548FoEMgTQi0oQN5BnpDtwBiKi5wsefHDUbYTJs?=
 =?us-ascii?Q?CuMbwjf5jVisv/Dqeb2B3Kek5GZcldmMmJuUJujjyERUvrA4SW5kdKp3BYh1?=
 =?us-ascii?Q?yOFxrBlPuA3qmCYvbVEfqthk6xT+x6DvTfA0ubhSDxM/0WyRwDKX6sNtqWyT?=
 =?us-ascii?Q?iFCLf0nWY8CU8W0YfMsmnwezw1l8V5PerfnnIcYUH1/oaQNfSJ83POWTsNN9?=
 =?us-ascii?Q?9dqcsjCDXE1u+ubTSNnoP3B8IEVChnSP8OqqCowcHVG22hizdiLna8zJpCeW?=
 =?us-ascii?Q?NuwGpOHAB4ZYVTgP1TRDSA6gxMGXOtLIVrZM9613DT38AhfFQhSRW1JBxCkp?=
 =?us-ascii?Q?75RaYtml15yLtUJSQ9OeFfTBGmNTtJmxNMI65J3S+iFeZWxWZ4FydqZwVTq1?=
 =?us-ascii?Q?m7wgyAv3rrNeoe9faynjHqNR0oZ+26/c15T/nigujklKQ0mIqi7GfguvyT8C?=
 =?us-ascii?Q?Nifie9rMvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67699067-1ccc-4300-adf4-08de8a220347
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:02.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQg/u+BReQ7CA6jYY7+g20P3e8NajpWiiaHQFt8WplazFxXsZgrhI5yibiaFkMcISwJ5RkNhDaEMRxFt+jhrag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

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

