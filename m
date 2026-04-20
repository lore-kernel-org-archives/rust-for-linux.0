Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022098.outbound.protection.outlook.com [52.101.96.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB221392C26
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680598; cv=fail; b=oizKh5C3563oJ5ChmuTnvV3V/rm0khi/0vQm/LlBPf7BKkHDMxmvPdACWjn8L8+cS0H1uYN8XuBVyTQyzW/c1bqG3iNySZjh3Kceceroxj4edoQ5c7rWxwZDK/JpJT/qAMQD/es4+DwzGT2KDNuNAh+4WpDwGjZEYLCrH4oxeew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680598; c=relaxed/simple;
	bh=R5CFz8G8iTWd1OYVaVxIvtx97JXiNJu1oZoMajtBt9Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lyhGWXDwpVd/LQ3f6rGfvLwBJJLWP+92SNyyYsry1kmfRBrlbzdSQFVfwwCLK9KL2siPw6oyAKb2hEAd5Ch/tAuPZXinpj+zAL1zjYLbVJGvaPAj6yi2XWsZQiMB1Vl/d5jWLokVPx4+TSZqsT8qYvl758UrvAINtiPUS5GeEVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n6aZfXCV; arc=fail smtp.client-ip=52.101.96.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n6aZfXCV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUYxJqNyxNIjYRU2BKjwwyu8LJSB7rh6xICSLLfD2HWh2hS6SQI91zPw8jqmk+HyLoJrJmKdLwlNqm6RbNrtoewNRmiejx6JA0GGRF55s/chOhwLIlWRgOauTYwfRsqTlre++sdLhrUqnl96cX4P2zRz93RN0bBwlyTdTSealEutWOh8F5VxL+Cxqd/k+E6LGzgyo3SA9BLGFHNEGV6eqP1C/xe7raiuGWPyBb1K4mZaMNOnnuE1NOyfw4HkYRVosNTrdkHW1sANBkqWrRufO0hdC4sIKiwljTCUS51nCJ2LeLHZUEeeggls+VIGya8Mpach6h0HrAAz7feSYJ6lbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paXjYh8EkvjTGRWO6BJ4kwnD9pYxNP0KW5ppzK9pL7E=;
 b=idY5JgfXmVaqPh2eBS3oX2R900P+ybrnQQdLZiyGJviegdPZahRXbjEIlHPGYFjYQ4CkX7z76PJV78Gb4NrlCBKM6zx5HuOTag6wybXUI98ilfW8x9fGijZDRP31T6kkVOg+KQbwWyolwo0KM5UwnmMolJOEhs0QYBibaxTfsXMCqjb+8jTUpBSvVGOEkmlDJVqvRKdaYhAPB/9eirBEB2Gtyhl7g/NLg8NWS3OSpL0UMEXgujMNFdvGlNULcGxysE36FnzVE13RpWa2WtT8tlV+tEJPPp1nLCq+CIIZCU0X0T44KhqCoprXdBRzbrHwIQsmDvuCKUUWXtduWnH4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paXjYh8EkvjTGRWO6BJ4kwnD9pYxNP0KW5ppzK9pL7E=;
 b=n6aZfXCV1lLn4Y/A9uIxleH3rC0I13xwK05wYwmP+zAIw1I0ARQHsFG9J4VMInY/ArsICWQgpk0ITbRHuqTFTU3YOwMsQHDgrc3nl4UXtAKnbvTGTwo1kMy7AnLl2AmYZYhFFe5sjeL3sd0YDHbElEwJ+EdHJXYVe9/TZCIb6Yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:259::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 10:23:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 10:23:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 11:23:07 +0100
Message-Id: <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-5-ttabi@nvidia.com>
 <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
 <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
In-Reply-To: <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
X-ClientProxiedBy: LO4P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5374:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ded568-4551-4d6d-00e6-08de9ec6d125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ply2oo3sd9fIqSGpiVHnzxsNTJi/Cx14V7IpDir/JfhBzAUHrzeausf5RUJHrYscgJn+xpaGcktWjVRPypnr5BG/iqwatuvi3Ec+JYA8DtYnI+Tt/IP3nZ+v/p+AiJrzwIfv42tZLi2cGNTA1scGrofPAdSpLBvbnpjrwr/ReDOakNZEr1k44cjIhI5GumDaKgifOE4axCxZFsr4KxRaoD0Pi/fXzRaSVgNr0x3lCB0FE6tk9inxkt79TvyZNLYmP48EEO1ApFCM4o9IRWm7YqsMTIJZaUxir2nUQIDAObE3MehwrCbhkuWnYykEjXpuo2rc5NYWORbjgvzKyGg2UVSNBvtmO/Ou02pqtGGuGSGq393oQISlR2PsNmHhIVcEEph6M/lwj2ydL0Vb38Nr7FGVZdaEh9Wis49Tz9MydKdyRSexZLtyL06BVdG4RekNt1bFh1wkVW4yzsjBbV/2EPdbrm453wmtoTZMPgiUe6GcL++Wo1HCBzATNarHhJTkQrvbBqupGpxfxVEzMsPaJGI2QGDVFOA6nl8s7+BWsB1CqozOSXvtOECmPzbzObNpYLLDYt49imTkLQwQvHH2BUfoQHM+FxPGrdr5cKDR56u7zJh9NRY6Z9v1ciSGivBaUpfqBbBPkn4NGjx3gmgePVvCGnxBdvbSx0sAKs2OdBPZgXNpNYiWU7Dj89xl5C7CQJ4vCzjeEQG4JEX6g4dSJNwSCrti82ZQYV6HEY5xUzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWgwT2FJaGg0TVlUekVzQURzVXVVSzFQNmpSelAwUHV3ejUxN1FVL040clp5?=
 =?utf-8?B?RXA5UzFSVlVrL2JnNFhBMUR5OXZiVDVXK2tSazlWZFBxNFp4bXU1eWNTQjFE?=
 =?utf-8?B?NmJWTTdhcmZCY1RWVmMxdnBMbGRQbytzTU5USW1IK3hreGdkQW54cHF1RUpM?=
 =?utf-8?B?M052SnhnWnlQWGVPV0RJd1hxaCtqM2srMmVGU1lIellaenFnR2xmeTd1Zm5r?=
 =?utf-8?B?RE5nS2tPWXRJY1Q3dHJZU0NycVNvT0Z2dy9qbVJOSkwxQmhHTTVtTGJKY1Bx?=
 =?utf-8?B?c2lmdXA3RlNDVkhOekwveHNGQm15MW1WaGpoL3BXVWxQZENMa3pVRnE4VzRj?=
 =?utf-8?B?VWpibGsxRGdHVXpOZzcxTVM0bDFXTHlTRVFLdmVNaTA2Tk00cnhrRjArQzdB?=
 =?utf-8?B?RDFWQ0FmSGoxaVpqRmYwWm5nN0w3RGNxNWRzaitXb0l2MHAzRW1SL2ZUWFdT?=
 =?utf-8?B?L24xNmlEQkh2disvKzV0eW5FU2FyeWE0NENRUndJV3F2V04zUUpoaDlOcUlJ?=
 =?utf-8?B?THhtNzZrN2FyYmFjM05oYWpUaWh2elBUNFhSY2pGZUMydms2TTZYNGhhVGRt?=
 =?utf-8?B?YWlWd2kyY0wwM1ZkYmRtNlc0RFZFMjFvRDByRDZBdTRyMXNDVHFEWjIzb1Ni?=
 =?utf-8?B?WkJZdUI4b3FtaVEyNGZMRHovN3NsNzc2MTNDRk5TQ3MycVJSUzFjYkZVL2Rm?=
 =?utf-8?B?UmJKejl4cnlxSkFha0hVMVZ0R0JXYTBJWDBuWW1yb1JxVEcwRzMrTC9sZFZ6?=
 =?utf-8?B?REhOWDFSZ00zUFdZQXlDbGEyTzF5QW1oQ0k4bHNwUmZaQVJHaElSanJDY2ZO?=
 =?utf-8?B?cldFT0NVaXNvUnZnZUI4MUdIclBVN3NrNTVUVmkwV21PS2pFUTFGY09iN2dU?=
 =?utf-8?B?U3pMQ0JRWFpxOHh6UFJBbUN2UE1WalVuVWtVcWRlNHZscFI5bzJFZzdRVTRD?=
 =?utf-8?B?ZG8vQ1FyN1BNSmllai91VkIxSkpXU2NQeTlQYkVsWlRXVWJmbVVWMlBIbm1H?=
 =?utf-8?B?OXlDbzhjdm1sSWt5NC9EaktEeVlzQ2VYVll4Z1AraUE3S2tqb2tNNEVzVW1J?=
 =?utf-8?B?TEp5enNzZk1hV0F1TFNiOGNBSk1TejI4NWkrV2xOMVVmdldVV0krVEVURHJn?=
 =?utf-8?B?RFFBL2FWdWpkbVU3TytNWHp4T0lVcFJzVGxTRnFpaWZ5Y0hOVGhsZlJ4bW5m?=
 =?utf-8?B?Y2g2WjBsQXBRT2Vqb1BUdG8vSThTbWVhc2d1OHU2RlJYbkU2TE5IRTVOdGsw?=
 =?utf-8?B?Y09QNmZ2S09OUGNFM2VscjR6RTRtVDlESWhFc2pUY0tPdlMwWU1ObkJ2K08w?=
 =?utf-8?B?Rk50cU1JcEd5N21KR2FYOFVpb3l0Q2QycXVuaEJURHhMd0V4UGxUNGNxRTlK?=
 =?utf-8?B?RW9jQ1ZzZjVmNllYdi9nYlJyREJ6MFhoZ0NKTDhiU2lrd09DRy8wLzErOWxR?=
 =?utf-8?B?S0djd29yOUM0S2FyUUJHa29sS3g4UGQ1NzVBS0I0ZjdjY1JLVUp2TkUyL0tG?=
 =?utf-8?B?cmJmNFhySExpWktEVDJPMG0ybUdlQ2I3MVpLUHBNandtVjJwZ1BTWFIrblRa?=
 =?utf-8?B?U0tnVjlEdTZQbk1DVXpQZzAxcyszdUVSc0VuVjRsVlZlTk0rY2ZUaUZxOFBa?=
 =?utf-8?B?UzZHTkJDcTY5ZUFqbjZGNnM3S0M4NTZTUFhPRFZpS2wvN2pyTUdaWm5MRjVo?=
 =?utf-8?B?SjQvekJSU0VtVjlJZldLUnJ3UEt5VWtMQlF6VmNBbjNOR3BSNkdlYlVCeWNL?=
 =?utf-8?B?K0R3T2RpVWlxVjFQQUp0WVlObktSeU5RM2NkUkIyZGR6OTdYWjRMdVN3NVpG?=
 =?utf-8?B?OTMwYUxwYi9KSmJXc0Flb1NKQ0Z0YlJFSDU4WkNEbVkrZkxiYWc3N01XQjUy?=
 =?utf-8?B?a2hFajlLSmJnelh3djNVa2c0N2xtbDBrcXo3MzFSa0VtLy9aVEhmSWRyZnVs?=
 =?utf-8?B?NGJBYkJablExck4rSi9yTE03akRrc3hGcEo0WkZLcytFcmZKaHkxNldLamww?=
 =?utf-8?B?LzlqWWROTkgzWHhhbkN1VUh5OUxTZHRQaUV5R1p1THk1VGVEejNUaWFyWFZv?=
 =?utf-8?B?cUVZZzJHVzQ1bFBPV0xWeWE5T3cvcHVjRVVnVUpTR2xuaHZPd0l1OXpvUlhJ?=
 =?utf-8?B?OHg3ZGxYSjVXaVFkSjBwaVRnN2VzMjl6eFlRZDB2VEN2WnkvU2hSVGtyUjhQ?=
 =?utf-8?B?ZjJSM3JrQ29FVzdHbjF1V2VrbXUwd0Mxc0JIbHFLMDg2S1MzdnF5YjM5OUdr?=
 =?utf-8?B?TTFLbHljRG5sS0oyazV3YmFIVG5pVDZJR2gxS1h0WUlaT3ptenhSc0V6Z1dE?=
 =?utf-8?B?Szg3RlcxL1dmWmVDT1lmQmNVR0lkYm9rMUE1a2NYSU5kZzFsLzBFQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ded568-4551-4d6d-00e6-08de9ec6d125
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:23:08.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7fmtp+QWCsdr5n4UTRmsho/U2SHv2bpae/S0rlI+HuaGq9kg3Zr/73OjxhoWKBexew2VaqA5N4UyJAH/VtZow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5374

On Mon Apr 20, 2026 at 2:28 AM BST, Alexandre Courbot wrote:
> On Mon Apr 20, 2026 at 4:47 AM JST, Gary Guo wrote:
>> On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
>>> Introduce FbHal method frts_size() to return the size of the FRTS
>>> window.  GA100 is a special case in that there is no FRTS, and so
>>> the size must be set to 0.
>>>
>>> Note that we cannot use supports_display() to determine the FRTS
>>> size because there are other GPUs (e.g. GA102GL) that have display
>>> disabled (and so supports_display() returns False), but the FRTS
>>> window size still needs to be 1MB.
>>>
>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/fb.rs           |  6 +++---
>>>  drivers/gpu/nova-core/fb/hal.rs       |  3 +++
>>>  drivers/gpu/nova-core/fb/hal/ga100.rs |  6 ++++++
>>>  drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
>>>  drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++++++++-
>>>  5 files changed, 26 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>>> index f357fb28b22c..a305a6dac758 100644
>>> --- a/drivers/gpu/nova-core/fb.rs
>>> +++ b/drivers/gpu/nova-core/fb.rs
>>> @@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, g=
sp_fw: &GspFirmware) -> Result<
>>> =20
>>>          let frts =3D {
>>>              const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_1=
28K>();
>>> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
>>> -            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN=
_ALIGN) - FRTS_SIZE;
>>> +            let frts_size: u64 =3D hal.frts_size();
>>> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN=
_ALIGN) - frts_size;
>>> =20
>>> -            FbRange(frts_base..frts_base + FRTS_SIZE)
>>> +            FbRange(frts_base..frts_base + frts_size)
>>>          };
>>> =20
>>>          let boot =3D {
>>> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb=
/hal.rs
>>> index aba0abd8ee00..1c01a6cbed65 100644
>>> --- a/drivers/gpu/nova-core/fb/hal.rs
>>> +++ b/drivers/gpu/nova-core/fb/hal.rs
>>> @@ -25,6 +25,9 @@ pub(crate) trait FbHal {
>>> =20
>>>      /// Returns the VRAM size, in bytes.
>>>      fn vidmem_size(&self, bar: &Bar0) -> u64;
>>> +
>>> +    /// Returns the FRTS size, in bytes.
>>> +    fn frts_size(&self) -> u64;
>>>  }
>>> =20
>>>  /// Returns the HAL corresponding to `chipset`.
>>> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-c=
ore/fb/hal/ga100.rs
>>> index 1c03783cddef..2f5871d915c3 100644
>>> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
>>> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
>>> @@ -66,6 +66,12 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>>>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>>          super::tu102::vidmem_size_gp102(bar)
>>>      }
>>> +
>>> +    // GA100 is a special case where its FRTS region exists, but is em=
pty.  We
>>> +    // return a size of 0 because we still need to record where the re=
gion starts.
>>> +    fn frts_size(&self) -> u64 {
>>> +        0
>>> +    }
>>>  }
>>> =20
>>>  const GA100: Ga100 =3D Ga100;
>>> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-c=
ore/fb/hal/ga102.rs
>>> index 4b9f0f74d0e7..3bb66f64bef7 100644
>>> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
>>> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
>>> @@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>>>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>>          vidmem_size_ga102(bar)
>>>      }
>>> +
>>> +    fn frts_size(&self) -> u64 {
>>> +        super::tu102::frts_size_tu102()
>>
>> I checked the patch history and it looks like this changes from v1 to v2=
. If the
>> argument that "both have the same size" then I think this just makes thi=
ng more
>> confusing then the purpose of deduplicating.
>>
>> All the methods above are either delegating to GA100 code or custom, and=
 now
>> this delegates to TU102 without any explanation.
>
> The reason for this is that all chips have the same FRTS region size,
> *except* GA100 which is 0. GA100 is the exception (it is also documented
> as you can see in its snippet above) and should be treated as such. Thus
> I'd say the current approach is correct.

Then it should be:

    trait FbHal {
        fn frts_size(&self) -> u64 {
            u64::SZ_1M
        }
    }

and only have it overriden on GA100.

Or better, use a boolean, I find Nouveau's C code clearer in this regard:

    /*
	 * Calculate FB layout. FRTS is a memory region created by the FWSEC-FRTS =
firmware.
	 * FWSEC comes from VBIOS.  So on systems with no VBIOS (e.g. GA100), the =
FRTS does
	 * not exist.  Therefore, use the existence of VBIOS to determine whether =
to reserve
	 * an FRTS region.
	 */
	gsp->fb.wpr2.frts.size =3D device->bios ? 0x100000 : 0;

so we could simiarly do

    fn has_frts(&self) -> bool;

Or

    fn has_vbios(&self) -> bool;

(BTW, I suppose the FRTS region really does not exist, but the start addres=
s
matters because firmware does some checks on the start address to ensure it=
's
within a specific region regardless whether the size is 0?)

Best,
Gary
