Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787533EB02;
	Fri,  6 Feb 2026 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351715; cv=fail; b=qLN5fbnlbS8G+2y/7r4TWwUpadz0hUBngIZ3BFcOVG0R4LPOStijL1X6KbfbDQ4wDpvJVsah45hySj066F+RrWwztOimWSRpJd/SLTHOdHzxeFogDTO5WDF4s9OmSKY4KlbBVXoeyag89FQFqLJiTNod/+81XkLxdxxiSb4xxhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351715; c=relaxed/simple;
	bh=+JvXnkBEeyczrUfIirS07Mc4tIhg2uugs/RqrR4VB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PfiMduh/0x8krxxQet9elC5no+kVinAq2gvRYL3LjwP4decv9vcAMRNjPTHV9xZ7aM8EVVc2izzSwkabbDFWtsN/DrPpDJgCru3YQBF97rhMJHr5ISQgzNRaTnj+DqOQT25Elbl4RA/7b530hxg8LV5GJnNnfIu0kuUxBQunOLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ePiU6TKu; arc=fail smtp.client-ip=52.101.56.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ePiU6TKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yu+E+xmuZD2ZWE0nXcp+7yZQNF+1bP6ldIgZskbxI/ehg7O25fzmmM+w2ZJER39x4YhJYMjZmfrOJ/LJ+NpHiOi09c/YMv/kWFVljrWSqNR2EqrXcedBX22h27C8J9xHarv+mIFn1c2ZwGx15MKH47mf9f+b/fTu/GH5gMOi5RwCni9QVyAAtZSyuxE3g1f9p13z+pCLNfu66S29tpW+7ZKTJxW74myX7DyWkHaS1M5jR0onS4bFq5v1EhlI2sZ3SR4+m+Q4dUEVQehkZpDT/dpycawOdfsU5rrvSoaIH8VJ3gB9tWW2hTrjexFXsSJ24uj4dUo0Rwahd7GnS4woFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5BJn1rOgNSnIYDJY8WMUhXKi6ZZUhvc/vuhNBTnyTk=;
 b=ajVrltMckI3Dc2twt+daWQIAP7EFR+EXuzYbNTNrMpfWNbJB0tDRDl6AT70CCbheqeg8cIrFtBB4ittZaI1NAzCS2Irwd2ISwxw9cCfIZcKJcMhfqiY2483j7AXn8zUakzAP2wbZTfvVCJLYu+R2cNi1uShKSJPTLlojRySQDIhYvv62MMlMEXMG7BKH0VarO1NF7rOaOFUeBG9HXyAsKyFtajoFiaYzCHs04dcP6iGqHFRMZ/CzYuIcKXp9Fh6yYF+RwOpQu/R0c+6uyHE3XX1ag9q1dY6eRkjigVSZ1IGMy+YHpk4q4EYE/MCjfx46AbXOxPgKG9b7oQZUoYi5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5BJn1rOgNSnIYDJY8WMUhXKi6ZZUhvc/vuhNBTnyTk=;
 b=ePiU6TKumNl8D/vcc4KzaRKgLrSkVWdCuE/eCj4GD+L6NuXWYEEkBsXgcAaq2fRY/oJ9KGBCDHWUglRoZ4/0gA7u6mk23g7v6r1c1v0B0tMuud9j7lMIQ8+MaOx5BC5MgOX4lGoZEu82KfVwfjhgl7hFNMqGzZG9Mf7C08/C7DCqUBIWG6Fn8tHoTA/ux86APRz03HyRURU1giacS7KxnCtmAxT90T4+Y8azzF5uzft3km38IwnDnWp9cFl9W3L/+pSBQACGobVRBWhyUzlh3aWbtNK3pXuMp7Q6pZzeqPX46DWjqSyUl2pO5p56ilMA3p7n4IUrbBTlkW8CW3cBsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 04:21:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:49 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 18/30] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Thu,  5 Feb 2026 20:21:11 -0800
Message-ID: <20260206042123.303281-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: db818a46-80a4-46d7-e611-08de65373f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?33sn1MiqRPpX8Fc9oDUtMcNcM+fHB+NdGZnusOBsuqZQo92ELvncfji921Y8?=
 =?us-ascii?Q?D2UHaNZKysnAlD8RFE1Eb2QlpTl59d0DqkPnykx5d3grAiwDHlR6XY/Y4Sin?=
 =?us-ascii?Q?qG3lPVFtoYlqTTvOscXuL4RsBQbsIe9HszNwO6loVuPx9ajAn14FnefU0vNo?=
 =?us-ascii?Q?b/H02vH8m7TzLFQsi/5cSjpByHn7pYR3m7NOVwIPE4cKa/rKZI1yirCh8SoG?=
 =?us-ascii?Q?aupOSfwgvkqu4SuK8B1UVxIGjWeVyopS6aZldjm+5wyW7IRlNPDlqmIrHKXV?=
 =?us-ascii?Q?oyiYePyl0hDsKhh58yrTfP0pl2K27kijpwuruWPJO0vt/LVEVapuVenGbHVE?=
 =?us-ascii?Q?g4JMYWtlp+kgDI5KUP2Bkd3rAPZf6RQyW4XY82eHh3L/qnDbxf9XuhvLI39J?=
 =?us-ascii?Q?ake1DcHjLWup9mh4GIB1p0yczyqD0/oWOGIdSBA9ANUX8OizRVvM1tBJztYw?=
 =?us-ascii?Q?iNIajgaoBXiqgg4qWYSx1TffdFz3uT36Mwdk86XFTlQYTjCdCIaMQNdeMUKl?=
 =?us-ascii?Q?a5BE4wufAGe2XS4fOchpzGwLViyoJVeXDXY5C9xuzzP+SoNX3fMx6dm1xOAg?=
 =?us-ascii?Q?qpSrsFfcEyY7JP3lQcD7OGQNlT8GWdfmTBif1LHvIRcEtH0Qzp0i+uGUbMeg?=
 =?us-ascii?Q?dWtAg112GaBX2nFLjU9iRkNenAEQ7arekJeN3/17Raozd24Ld7oSgWjukAkH?=
 =?us-ascii?Q?Q/gHp3EQJpS9eCxWuOfeeAMSNcjLJiuFvl9BgsSy5jLrS/3xBm6/2zZTHFno?=
 =?us-ascii?Q?ATbynVCpKtbudiqrIfBLDeaHbrkZHT/oJ79WwtJSHBufjCe0+j9MVnhBcj6n?=
 =?us-ascii?Q?V2ftxOWd54LxwBV7mTbybxD4RsN09IPitPCfCTMbLLXNMRqT9QWXl4CHYNVd?=
 =?us-ascii?Q?3fxCK9EHXxyZdssTuPjooaMkDqUIZMnN9XZAThyg9ghbktR9bDtaHQxSz/p1?=
 =?us-ascii?Q?RMln20qRo4YBvWOD0SXvJzfjmboGC+dct6j6PVO+Do7g4hsrIK2o12yXsUhs?=
 =?us-ascii?Q?4yQ0vzg2BajeFepFm+BuW5IAD6N6esHv0KOMHyIq9X8dhU81iI11acybACBw?=
 =?us-ascii?Q?b9+J2m8/oct61oqxJVb6SWZWXmfBhn70vSjgW/eXWlFDPD/f9cA1BUPh4gXj?=
 =?us-ascii?Q?3vVDleg3WV/iNVx8JFtpMxel5Q3PO5GVFTuvof5nokogt5h9sa5ewJ3djBlo?=
 =?us-ascii?Q?q7jAEYJGUMkcArrporbhxdow3XLFGidV/lDU4gk3NsxA9w07VZH5eC9voCbj?=
 =?us-ascii?Q?2jwUur1r7ZYH4TCzEImNnrk5xnlqxAJlWpc4NOHeWrj0EbsmaiyO0EGIAHul?=
 =?us-ascii?Q?VVIpnVM/q0N+aSXj4nfvgCAiYfyOUv/uws3KGJY3n1XrbTFxPMvzCL7DVhFA?=
 =?us-ascii?Q?7IbTr5Pjbb/Lr1+Sl7gHDislGLhWdGj7c2PCm4y+9l9/GwzsikkGGs6BbgGi?=
 =?us-ascii?Q?ZpKGHNrmvTRia5qLtU1f4ARzMYx2uRLNl/rVnJKk535kxy8JS0k7J5PoilbA?=
 =?us-ascii?Q?MCw/ErGh1WNgS2KxXSz6aUES6EN1X1AiGZpwS87qn6acldQXzZwcCStEvjw7?=
 =?us-ascii?Q?0YLEWsKc5+q9z2vwobc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JWI/G0ts9xzFdOBEz8AAHzBtVl5E6NmQGFwhDspBXOqWPggOcO6EOPB1Y22Z?=
 =?us-ascii?Q?cR408LEUGKj66o60rayn3ri1RdOxj5QDOfmNSmpuUW+9ZOryQeBDvSQrVYGC?=
 =?us-ascii?Q?BEWpI7SQ9yp8MOI+lKyf1QxL3AvaRLkCRY2ADjtuL7MdjcpeBxWuYRIfbfxf?=
 =?us-ascii?Q?NmSC5uypLKTBichp0Vi3fxlcr738By+jix+x9FpO6aL2npN7+9/1M6EhI9sR?=
 =?us-ascii?Q?wIAi3f+NEt0Y+q+2dMT/rLic6iA8AX7Q5aXO+F7wGwQpz6dll5a9FDC0dc6U?=
 =?us-ascii?Q?2XFNLzp17N/VCrYhbzeuyMUs05VsqRS8if1wq7HSqhADycduR/uZljcNKAMu?=
 =?us-ascii?Q?N45YJhPPHa1aL5lfmhji5B8c1PhwzGZUyucDnTSIzlJ/G3bnGTDkun4HmOJW?=
 =?us-ascii?Q?hud8CZKtiomWmxZreg1nZOEhdNPCbuwba/46JpuDq5p4aVxi8XEPmm7g01Va?=
 =?us-ascii?Q?5cWdCQESa/dKjN9lqsvwB5VNrvEJt1T189AWOf3PtxvoohdQpOfA+ahHA5QK?=
 =?us-ascii?Q?aqJnraw5vzERQ8r/G0M0C6jDLQ2A1w5WJVx954EaLXmyfKTtAoxahS1oB5sx?=
 =?us-ascii?Q?QDLt3FboQqzlglQWELBHNO8ApNkja6IVtw0jfc/NoloV4LkGu+ed29+ud68u?=
 =?us-ascii?Q?onP1P7IfmFYp/TdtReKYVs9dw8zxCkvByTpcreb33sis7BwrZqyWGFLsDAVc?=
 =?us-ascii?Q?xLepFS2bj87GMPfbrizxfjDeXAPaS6Myh1+OlLPvm/casUOsXhtUXJTu/qV8?=
 =?us-ascii?Q?NWTuUbTR93hyfx++OWMXFfbYXPAXUeZJKoDRbIy/MkJhy/Nb09s87H5FHAST?=
 =?us-ascii?Q?+/UxOVJv4HTrfBzlkHl0g5+Yeh2MIIb4Y0ifs3rYantRuE5LsywnLVMBM75j?=
 =?us-ascii?Q?zJ4HBD+48nZyo6eSODdbGjMBIOdb8aAZ/jBnTQmwE621Bw3s8Ff26/qFIQ9b?=
 =?us-ascii?Q?MtuibWRx6YXKFHI0DfKQcrx6G2kudB5r8htmWf3uICU8CbSxi6IKeR683UoD?=
 =?us-ascii?Q?CMrbZEQpBJYdP2jkD8y4FreCpWL40VdUA7pfrtVrg8HT6bPbPz+UTg2xE1Pu?=
 =?us-ascii?Q?G++xMQknPRk4y+Ki4LdUVJsimrzYE+cyeXzLPOpUbwXlORYIIL9cmYI6rfmU?=
 =?us-ascii?Q?Zdl91apeVKqoAK5Xuzs2qRnET+1YyMxXbKSwWTOewRfENag1pi7sV3aHmgDK?=
 =?us-ascii?Q?LTi1LWW/lVz7bttYf0C5lE7KJMh6E1B75ROq568TvCZnljtsYPNiCesdNRPp?=
 =?us-ascii?Q?8NAP3mJL2GsQupawyONriWJMyNRCweX46b4Yoxt4+0ailITwpZfT2lV2F3Af?=
 =?us-ascii?Q?cqOzCK1grwqjI/Tl7Flow+sdcDnYdWipLZlAeoMaz0+m8GH9DMqAko6hn1sG?=
 =?us-ascii?Q?FzCK06kE5MuUsKu6MKfeK4jSjMwgfALD1dWht2UIiu6x9PCXFMSpwmXwaWrZ?=
 =?us-ascii?Q?kkrkGq2Fojv3ZeGrrLNHovTvuHTDCECPr5GPVhOqtG0m8/6LR6waUIrPwbw7?=
 =?us-ascii?Q?0gBWqIBceOZsMbrpwMulxdzfwUEmPIyQMehjiWIxceLyr64XGIGrUEDw9Ncx?=
 =?us-ascii?Q?ymBr5zh5w3bre6xAprJ0rIid+2NSK/SdPTkyr0Oy+2IkmlLj1DppIcpeDwpQ?=
 =?us-ascii?Q?sqhVfWcs5t4K8ptZ5dNOirXF2GKEvOhJ8mrHuPeGUSEFPDI5GjMiBgH41C+W?=
 =?us-ascii?Q?7cpu6eVgMw3G5KwHzSyaJiAHvOtHLObH1N/io7uTRQgMCDGyodP7/HktK9F9?=
 =?us-ascii?Q?2v+Aqp7Izw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db818a46-80a4-46d7-e611-08de65373f73
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:49.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA051UKspE8gb/lT/lQSjhEarDObhL/FMcuhbj+EzXipUzT/kgWGrALzbID423QViYZ3jz61WSY1p7vny1BnBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

The calculations are const, so a new const-compatible alignment function
is also added to num.rs, in order to align the reserved areas.

Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 18 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs |  6 +++++-
 drivers/gpu/nova-core/num.rs    | 10 ++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index e803e6e0cdb9..9b4407338724 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -170,6 +170,9 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// Total reserved size (heap + PMU reserved), aligned to 2MB.
+    #[expect(unused)]
+    pub(crate) total_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -257,6 +260,16 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
+        // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
+        let heap_size = (heap.end - heap.start) as u64;
+        let pmu_reserved_size = u64::from(PMU_RESERVED_SIZE);
+
+        let total_reserved_size = {
+            let total = heap_size + pmu_reserved_size;
+            const RSVD_ALIGN: Alignment = Alignment::new::<SZ_2M>();
+            total.align_up(RSVD_ALIGN).ok_or(EINVAL)?
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
@@ -267,6 +280,11 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            total_reserved_size: total_reserved_size as u32,
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    crate::num::const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K) as u32;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..086153edfa86 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -183,6 +186,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index c952a834e662..f068722c5bdf 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
 impl_const_into!(u64 => { u8, u16, u32 });
 impl_const_into!(u32 => { u8, u16 });
 impl_const_into!(u16 => { u8 });
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`kernel::ptr::Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+#[inline(always)]
+pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
+    build_assert!(ALIGN.is_power_of_two());
+    (value + (ALIGN - 1)) & !(ALIGN - 1)
+}
-- 
2.53.0

