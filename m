Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6BA30BF77;
	Tue, 10 Mar 2026 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108699; cv=fail; b=AwyRosg8KPMP7vBfsXuTM0qwBf4OzLDL7Ufvp6yTXFuq8rVXgq1V2YCcuuCuMEAbMOjayP2FwAX96IiwxlsJTvV98PaCsrpOA5uCirRy5VFMy65XPuyvqIQ5eQ47RrhAvgBDimahiLhsDxUBMsR5hmXpNI8wqUHAum+x8larwZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108699; c=relaxed/simple;
	bh=9nuFmmpKFACfkJsPkrrMsRM5gllAGlx4n1LHgeYeBxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ki7l+M6Cao+TonndxVTcHyOZnPdU4p4+zs5D1nv1HqbiihZBwo1XZKhSt6b8xUOLXyEIl/K/IzydpNs7/jJkaEdyvJ+qFI4fNxdXKLF6rWLwzoQfCNZCaiLqI7XgFxdHK9Xh5VM3DeIO6ZEnawgcpus0qROKgD7qnb+kDZEd07Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y/XWr9Yk; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y/XWr9Yk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ58SYLbUugUN1sx8TlRmSdCOTnt30JXNM4E2iLA8gLHY42ZVEbrUHhPVdZlgWEhdyRt7p7cndC61/WFXxlYpnseYcFEJhJoTkuw7J2lWyovedPPV5skstmIhJ6epOiLJ8UoYLD6/r7XLZHqZk9E0tSd7vkB4XDCWZ+TgdS35b+qEzEzG6/XYR9kGq0iTI/oP27VPGhtbXc4qSEbss6orQE3N2uaTEGl2dE8dZLPwB9Jye1azt+mqVhxDvdP9YKnvEN7NUvg1N8kwd2T51Rb1ZFTzzJq5h+NDoeE+215YFI3V4ss2lwBaXjwwwjO/bBQOYL58znCB9qHiUaVO1Mf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2dC+GTEE51UBugP02o5ThdYy8aLX4bciPEAvrFTvLo=;
 b=BBODXND56IlhAVVG2taCaVdip28FaznZOd/L9GQ4CdarGV75/P8I6RDi8ZqvqolGyCf1qxyvUyfmJv4gD63+dYVdu2AOfYhU19gsXsa4tCISGa07C6oROjaSz+f8Esccx8NnbOH9z8NCe5x7o9Iei8Tky2G8htHacN3GRpxwCirbdInxTP2tYn/1f7E3frP/qkZiXZz83fnxDueoM7pgsiawoWuelJKBHY862xJM2V/JSy8hZkLO1EopPESay3VqIv0CNCZQVjlbNV8FwlA8vaRKYGBPIXdHz9rB1TPTdFnu+bVVL9ZLhgXkMUCk3Hoz28Dd4ThzTT2cIozc/75sIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2dC+GTEE51UBugP02o5ThdYy8aLX4bciPEAvrFTvLo=;
 b=Y/XWr9Yka0NcVmRvoCwxXfnpZoGn1fsVid1VXm8ud19b4ylmQbLYvBBcUbiUosxtW2GfQM1acV4qeh0HI0LisrKAdggtNcZ02qcdnHg2b2L2sZQTDpBsZ0648rmjRbuW/cIpRc8Pa2bWWm+mG/UtHP/F5wmT3BORNN2VsQQhGxxpym9smoKTnRFB8q4MrR9eI3inrt1M9fJE9vot7hoz2Fg5KaBVlr5UbQIzC414GnulTRaFiuqzGy/hET7wDI/PoKYz/SbRbkTvgBNbX5jIjYVkGN3UmlK/GTaNSCdTPz9P90xqR8H0jLSaLb7mD7WXmWwBm1l1F8/GDrlnmMGRAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:31 +0000
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
Subject: [PATCH v6 02/34] gpu: nova-core: add FbRange.len() and use it in boot.rs
Date: Mon,  9 Mar 2026 19:10:52 -0700
Message-ID: <20260310021125.117855-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba82d9d-465d-4cab-a98b-08de7e4a5859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	6vWgzrnEWB5pI8tb0yrue7f6DODlVi6BDmnBbkgz7j0fVDDLDlbDRkzM8RQV6PGIa5zsPqWr7so7a5sNIKVVcfMiFdCW7blpOemqHI+1NiH3SkRl/42YeGT6ohdRcnyAfH+csr0zAkpsmpk0xvRhc69PZaX+sq2qbSLIrxHb+vf+a75gzIZyhs1ghsRSWHg35WNbNOlh64Fy0+jHUAX1lzituRZ4y0LCD9AJgVoV8zC4we3wNoAxj+iBTBU3sFTnSyPcSlZE1PNa85JJoMrCGiDAPgeuKBBDCuiJWbWXYDmVzj1eGjS5+8VipYeY/c3nTCEZy98ylkonSxTG9JATdSlPf/b+haiqECOmV1Pz3sA62xlR7hknfVd5VQ0khvM8AiyE4z8YLHiwfQEoZ/Efafl14qqcFY2ad8KLokJ8PVcXZBz2qXWFb1r0OxouNDsF9rktSjUTk9VJGgSEOgWFikmz7GNcM4ts5n7SuWG1b7roPv6aMcY6YHWEiBrXKzKHWTmll4T8fCdNRYwA43o9jVhnfgD24uxui6f0x5K/cecCNjzUjb0XpfYBXCmHZFRW+cKR0PPpezpGsfmpjQt+hFAUjjwRizUko+ZgGjCz/ZmqmaAiUlcY+6zXhpWVK1V+gdeLAEa3/8xFafbiyy8wtxQxRBJpRWCAIyLQcvf0UkVJLZYuWMfc1s2vRa8xwihq/R4pX5YMecF8Ov1pwL4G5/6RPudcEmjR4lGNdBSAS/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AROYC7t6VyeNbhXgKbUFtLpbnQEjcB4hhXNYyFrrsoUW8AIGOmQMLSK+L+m2?=
 =?us-ascii?Q?S18PJ5RZ7F5Aivw+/NcvkVR4cRoPbk1jeGM5v4ZS0iqNBoIkz5mulJu47wxo?=
 =?us-ascii?Q?EiXEqUt0jvCzXzwAWYUTb9NFc5sk/NMep9/5+KqXdeMvfJFSODkHkVWj3CxK?=
 =?us-ascii?Q?E4CTBL/jprLazSCLEISIND834akodcgsAstEcOHYO26zSHG/6RghQuZ22pPf?=
 =?us-ascii?Q?M/WRsA247JTOcQxhw7Z+x45TfFkpDOmRnoFDRCvmj2TJAMmnKAJSrZ1VS5Is?=
 =?us-ascii?Q?drPOOW2BpyPxiGeci0cdUfSElQw7cH/N/uWoS0bwBfPBdbK/hT/fWuyktKj0?=
 =?us-ascii?Q?GZrwbAEHvRJ3Es0k/AwVN9uKEVQ/mkUjRXm4BoByDqG3xqqFe6ahLDE21Inu?=
 =?us-ascii?Q?C1+P1u4M5eZkjZduiPQhGgbfDYJh67X709p3bALc1tzISbD7GHlUwq2fjCOS?=
 =?us-ascii?Q?YD2e9z1gm5r8QV+iMgve0u7Fc08FtRc9OYBBlid6U6JNQUxLYIjR0z8sm2h6?=
 =?us-ascii?Q?/Fz8pY6iLTcw2uVQ24zJjXGEiHTku4wmfwk17VSJ7wvd2d5+Z/xtQVhTg9/V?=
 =?us-ascii?Q?bMOeuvepSrd3ISfBTlAcyWF26GD+pUbL3N7PqchBp191E+bXvHiVOxYUPj6R?=
 =?us-ascii?Q?nSmpGrWd7cMWT6DHLyJQylsKjFl/+FNMBRXsysujalHm10TXzhLs8u2HoJKW?=
 =?us-ascii?Q?6FsJSEbWvhE7D5QZclYQhFncV8K2k3Af0I86J3SFYE6oJEJyz5T2cSL9zrWB?=
 =?us-ascii?Q?M4Vcek+HVgWxCQ4WQwu/a1HfJlJ4H7ONTX9Ow6wO1n5OMx8Cxrr4i/D4lEVr?=
 =?us-ascii?Q?6rRUrWkKskwjkKlKK/WQ9Tqg8fPTkzfgHW20Ld+MYe9W3Q3AOELjNxJtvBvl?=
 =?us-ascii?Q?E+x/WwBc9/1xnA0rGFQBHibC4i0euD9+8FtBGxVi/hHXBqMU+5Yhm5NnnEyq?=
 =?us-ascii?Q?MZhdEDw+OzH1jWMCNMqmmaXgNYgmDq4/TwdUZ67P7QIh8LXFU70+j9aV0U7J?=
 =?us-ascii?Q?wYFcX78ToVpHrbRpqCxr0c9S8iJNgXbr87gjSnjiRdHOq/Kh4yVu1a310ixz?=
 =?us-ascii?Q?E+9iWu70ezUFWxCnRXaheLSbn3PmINtU/Xde4uvPPND1kmBcBh95MZMfbQh3?=
 =?us-ascii?Q?9QAHDdt3nCGqaPK4sJM1oVB/Cwv82jQR9rk1DSeTN4McKhUlSjLFco1nvmtJ?=
 =?us-ascii?Q?2kBALOPAexSigBYVgfWlP+LFXkfuj9UF7dOfcX6lsQbH5L9z4xY3ArFcsiZm?=
 =?us-ascii?Q?/lxj+85Rhh82rF+x85pXb1Qr/IV2VZaafdu0hYOFq0oYW7YIwBNovsWGtTo/?=
 =?us-ascii?Q?w+nB6ATmAszWW+G/iXZZn22boRP92KtiVvjB81bRVwPDx9FLKvUyQ25O3C91?=
 =?us-ascii?Q?kN/dfNAKZuQbyG8omDjDeHJ6w6REzpR7ngct0FM0U2VCPjgTsHoTpgmyDryS?=
 =?us-ascii?Q?ZwueJlKdvt4AFG0Mz13QjzQTmxAYr70RQcX4z6ddd6apnOGo5iiybM+7nr37?=
 =?us-ascii?Q?DxltH9YQ7omB+ovKwtx3XPaZhXyNCc/aWMKMyOOloUd9VoxRe0/W/ogvnJlw?=
 =?us-ascii?Q?N8C77LVwgnN74a9fBGyXL8ZnT8CBYV9jB6pazQ51CWRsLwNRYAeGJFFNne2X?=
 =?us-ascii?Q?CIg8w8dQZE9Q+mSORCv9svA/gTkoaXECxfaP8dMDlwn46Mt8tvG1zKC6onBq?=
 =?us-ascii?Q?HKSJu9MwrUbh1X+2xZX8cC2/ZMkYEy0yt0hl3VV4nxcO62TS3gckF3KqUOhu?=
 =?us-ascii?Q?HBXxb+zPQw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba82d9d-465d-4cab-a98b-08de7e4a5859
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:31.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfAHAfvsN7fluE9FueOBoEXDxYPnEMQWRJ9M7piSxWz0NlQTZ6N5kX2V3RVCFGaCcp8WOSa0aRVN//6CCXh5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 8 +++++++-
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6fb804c118c6..6536d0035cb1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 
 pub(crate) struct FbRange(Range<u64>);
 
+impl FbRange {
+    pub(crate) fn len(&self) -> u64 {
+        self.0.end - self.0.start
+    }
+}
+
 impl From<Range<u64>> for FbRange {
     fn from(range: Range<u64>) -> Self {
         Self(range)
@@ -118,7 +124,7 @@ impl fmt::Debug for FbRange {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
         if f.alternate() {
-            let size = self.0.end - self.0.start;
+            let size = self.len();
 
             if size < usize_as_u64(SZ_1M) {
                 let size_kib = size / usize_as_u64(SZ_1K);
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 9a00ddb922ac..d278ce620c24 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -73,7 +73,7 @@ fn run_fwsec_frts(
             bios,
             FwsecCommand::Frts {
                 frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+                frts_size: fb_layout.frts.len(),
             },
         )?;
 
-- 
2.53.0

