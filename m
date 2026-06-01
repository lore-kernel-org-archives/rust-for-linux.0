Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01D3C1F;
	Mon,  1 Jun 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296599; cv=fail; b=g9dUuqC5v1hAXyeuEm93mWtCuQWD5xAeXAXyHBCiSucoQO0xXTN5+NCYRGvHRMIFeFA5GbdQjPmukWFcPjvpAGCl45mx/JvwKrmBk2nT9wUEJLqlSQX6rKinTB6bGVvbWk4bh8juY/QA42tIOW0ryHktq930Z0Nttkl71DYuMmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296599; c=relaxed/simple;
	bh=4654fyYnd7KvXC9PpE7/HtgB2icqNUY8Nmn6InggLQ0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UzwZVHGpHC+zzdxjJ1a4SlaO6BD2E6xd6Hmqdah9Fh6TxX+qBvCYFEXnShjEin+IvlDAmcd3EMIqvZHWTjfexo0uzmuGQTkXRGWG68ChVrw+EO84/4VLKURUtPDS/Z+QoB4tbkn99UUb+KPpTlBu0hyDBh9ulwf6J7bHi72t9uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CaNJsfHW; arc=fail smtp.client-ip=40.93.194.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CaNJsfHW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCvi2o3UnzbeyizMTw6Q+JkDWbxgqrNHCsr90VrIzlJAxjigKn4JyPMc3nD4nUj+6LHmQpybDH5Rk1raQw0n2+Yf4XrlvKJ/DgqODSF0GqRrxpkr+caLmQOJjzAgnm6DhXtOL1qCTr7GXT3EyNg4K3UQkylvlexWi2/BHjE7qqltN4jXE1rJA4m4l7iFmC18zW3/2e+hOCxG7LIhTndxK6bA+/PuxLZpssYxleuNaUb2dTQ3fVcRftCpHxh/hGE09r0DQiUV1uEa3eFmwE5N04hKk+utpWxkq6uJWFoHAM0YvlX2fkefMEDEeQifP/kBHPmsRFHq/X7Leg0G4nUu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVztw/daD1ciU482q+V7a83UKxAHqFox4tisGAKcyTA=;
 b=Zj77zAEE6JG58eRy8JiAYHZ151r8EEwPvB1G50xCHm9Xf34iFFAUaw5iBYNUCNPQPRtoayDbRabEnr9apC9WdFYwnZ+Fo6+9iYwEnGyM5lPY0I/Y/3foZLuvjlUEFomlUatuaXUAazCDx8ccQZorthMyd0BeCBTTufmyYWt4AoNw5UihFIqrxMg+5sXFnyvGHdyPscaODB86IJYvB7QIw7bXEyKA2WKYL3t/qFb/SUOfecDh9cSuD2clongPL/1MZS5V1h4eWt/vXKBwGCHzUb7yld/hKWQF+ehQ3ik1qcK9Ko8GDRyEXBXduxCfXgpWynYfXTwLQFvt+2CuUNhlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVztw/daD1ciU482q+V7a83UKxAHqFox4tisGAKcyTA=;
 b=CaNJsfHWriss72goItvhUfa2mn6LyzwV6bbMVAHKuy37ApoqktM0FzFWsECCEpC99SlJKqpKi9pQYOhrpElxfMtgrcc373d/HhC416NFICstv/hgXRzaUryD/YwhmFAcLea93R0h8/5HDIfyGTDZkTGjwx5Ti2VZNL0tsX40ztQpX38P9yG3UHD9Ky+53EQdjEG+Ez8gbfHuSEl7P/XNK8ldJOOne3TPlP1jIwHUtUAACYVoM/9vGFJyAoylNxmPivmXTXcTwALptHeltoT6V+d4Obfi7EiIFePXSALC24bUhoSiDU5nXedG5mXzt32x9u1L3QSgUfQ0Ia4+OatyDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 06:49:50 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:49:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 15:49:44 +0900
Message-Id: <DIXIGWHS8N4D.H32LHAKXW5CU@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 09/22] gpu: nova-core: add auto-detection of 32-bit,
 64-bit firmware images
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-10-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-10-jhubbard@nvidia.com>
X-ClientProxiedBy: DB9PR05CA0012.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c70361-6246-486c-5a3a-08debfa9fa74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|10070799003|1800799024|376014|18002099003|22082099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YwFU+bImj1QBtQWOUAvsQe7Ato5lVAqdEly0A3+yCe1o7Pho6Y1/j3uFyOWEmV/hN5GjVpF+Cxs94GBxtqKPsS7B9Ax/YgKbX6khAF07ew3INM2j3149AnhwvXAnnxp6fn8jzhaHDB2uaLKKJAjsTh20qjSUPmikUHpkTk3MTKoRBJ5IJfJY68Qiful/O6DZxrqHGX5R0BJj1GCzCcy+T9FEHonYPEWF9OH5g0NlI9Ni4rKzw/ORPxQpPiXSPGfsJhIyg7RlY5rkaKSdzhrRlZjQCbjVAkktHSDA8d5PjRNzE3msitagFy4Np5EPesoAG6Qew9QnyDaVzjgb8lMYFPO1PUE46+zTG7BHBHANJDYr61/Dsuof8Wda6wZk39owVRcj59F/IC3bCAUld5nYh5xDvbVFJeCRAVtiFcztKb4TqdgLDBkJJ4bJly4Wlio1vX/jseI9LQohhH2zeX6R2PXt5xYf9EMZYuO4gbjk8VAonIrIxMzW6qEXpXskrAU0eQgK2nVwqkPw90jpsWxuCgezAtnjOx5zdvjphqpjNccK7Hc9r0t9pxqe4lFER+KLHLmsu7e0o1NV0MEE40w3rKCSTJxMJpjiGkNuBYsl2561X4AyC+97pfi9VYNrexgC3NPFuXbfCbx8EBRIELr3OLgxHQ1dhJf+yqVBiwc3dCzBS7uxTNcxXjO/XdcweqGm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(1800799024)(376014)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU10UCs3blRkYkp2SWhqSXl1T3RERllyZE9HRkhlRTRGcGFURmlQRGdyVGRo?=
 =?utf-8?B?OGF6T1V1ZDMxNkRCTkUyLzZPeU42c1gxek9DR0VTQXVSek9veWhaZHdxdmNW?=
 =?utf-8?B?VUdtQzM3Rm9jNC9DbURqRWV3bWVhWFhLR2xOc09mRlZUUmR2VStmaDVUMHNT?=
 =?utf-8?B?eTF6VlhDR2NFYWVBUFZSSlI2OUUzS3p1Rmo1VnhEOElTZFpyeUx3dXFOZ0tN?=
 =?utf-8?B?Vm1ycEVyUS96U2JwMHFVWk11TU5nNEw0eXpmNzVtN0Vmbk1kOWxpd2crZ3Ba?=
 =?utf-8?B?a1AzY256cVFvVTZXQ3d4aUVLV0pUNWFsRmt3TlZpY2dPWm9PdjdaOWtUQ2F4?=
 =?utf-8?B?Q2lBUTNhOWxObS9Yc1RwRlRGMDJXU3NZRm8ydGZtcDdRUFc0LzV0NlRGNGxW?=
 =?utf-8?B?SVgrcEVHVE95WXNodGw5WHkzTXdud0FDWUVnRWowekZ4c0N1YmwyRFVCTzF4?=
 =?utf-8?B?SFliOUllTTREWitVcy9ScXZIZ3ZEQk8rK0FoTkVBQVZmaElPaXNBcVhvUStn?=
 =?utf-8?B?M1N4OGlZNFhwZkl2c3BYMTkxYlZHQVN6cHF2WloxMGNoVWgvd05STVBrSmVT?=
 =?utf-8?B?TWZ4Y0NLc1dnSVRQTGxac25mSG5Ea25TTG9PK2labmZaU21ERDRVdmdDNXEx?=
 =?utf-8?B?OU4vQ210bkM0SHh0Z2hHNVBYM0E4UUZtYVBUaWREQnJWdFZOb29kNThleE5B?=
 =?utf-8?B?eXFvZFhNL1JXbDRIZmY1RlI3bkdaRHgxeWs4ZkxDK1pReGFxcThCUXdzdDd5?=
 =?utf-8?B?bkVpdmpXaHU4aDNOdEhFSFFWMmlVcmlVRUI5NnNvcUUzRHJrNW5KeUpvYW85?=
 =?utf-8?B?WUowOEpYNXNXdko3SmdyMTJGQ2gvbG5nQzVFWm05WlRoeXdWQjJ2UXFTdEda?=
 =?utf-8?B?dC92NUpkbjdZeUw1SXNUUktDNFErbkVMM1p0TDVVQW43OXg0QnovMGhzNW9o?=
 =?utf-8?B?aDN5enlEbG80NjdOd0M4TnpMVGVqY0kyT1F5OFZWRjcxWHU0azY4bFE0bkp3?=
 =?utf-8?B?Z3hzd0J3SFpwNUdqampDRmV6ZjVOWlRvTlR0VUs5QWNweWNXZFM5VE5PdDhK?=
 =?utf-8?B?dnpkVU9DdmpIY1pmRkNjd3lKUGMwcm9acVJpdGhHWm1oei9kMGllemhSZ21I?=
 =?utf-8?B?MFQvM2hhK2N5cyt1VkpUTXViQTdpQTY4aXo5NTdBRkRrcjVhZTRWTnJNVFds?=
 =?utf-8?B?Uk5VQWJvb0h5ZEhNdjh1bSsrOTI3Q09rL21qS0tiaUFycVBwNzlUYjB1QndD?=
 =?utf-8?B?c3ZmZE9KeEdvYjVja3lvMWxmWmxXd2kza3I4TEVwVWJjc1QxQlQ0YjNKcUx4?=
 =?utf-8?B?UlU2ZnVYK3h2aVIwbTB4ZUpXTDg0WjBuZEp0UVR1cThkYy8yeitxZmViaGE3?=
 =?utf-8?B?NW5oRDVUVjdEUkJOT0ZtUE43NFlWL1hXWlRBdDE5bVg4bFl5SnVaSmJma0xO?=
 =?utf-8?B?U00wbmpPdUZCS0FFUEtoRmJkRXl4RWt0Q2hkekpPSTAvRlVOT1AyYXRRQ0d5?=
 =?utf-8?B?UXRIU2FUaFZEMnFWV3ZPbHFlOE5jeUFXV0JxVjFqSjVvTnZ6NXkySStuMjVt?=
 =?utf-8?B?T2xTZFB5dlBxK2YyRTNIcXdaanhDRFZjVTRFSjVTTExaNkhHNm9lY25Mc0NS?=
 =?utf-8?B?NUdBZlZ6OHVScFJzMlNmM1NlYUVQQm1XVjRoNmpDSFd5UEhoUU1ieGZLNGhh?=
 =?utf-8?B?eVR4dEVoMHJrMVFIMk1FRGZhdlBRTHFPR1ZlUWV3OGNnZ2pjblVscEg0aUx6?=
 =?utf-8?B?Y2UrTnJwOVVKeXhWM0tjaXFld016dG9EZnNrUEltWmNpQnlnVWRSSGxCdUZF?=
 =?utf-8?B?d2VCcURmOE11US9OcXBNS1lFN2hGYUdqRVY4SmMrdmMwY1pCOVN2cjRRdGhL?=
 =?utf-8?B?cHpsUmNFVUVpaEFMYW55bkk0TlBoam1pMmlyMVQwLzMxUHFwbWV0TzBnVFFO?=
 =?utf-8?B?TUtzVHUvT3E3bmpzWDloNXJiTXlnaWgzUVBzUlpJSEphQ2MyYVBPZFRWUjhT?=
 =?utf-8?B?RUJJaGNzZTdUdkhBMW9SUEJ0UkQ1cFBqMWZIbkZ5eXMyYjdYNGhPOUhack1x?=
 =?utf-8?B?MmRhS24rOUF2djlLeUdCV3FFZXY3Z1JjYTJuUGlLQ1IwZm5LQ04rU2g0djNW?=
 =?utf-8?B?b05WQkI1TzhDRnZETFAycnNDTGR0Z0Npb1MwRi9hb0trME5mV1BZQzdjYU0x?=
 =?utf-8?B?ZSt4Z21kNTljMXcxd2dXZzZPMHE3dGIraXVsNVFsek4xV3IvT2ZUZWtpbUVw?=
 =?utf-8?B?SmFnSys0SjZqTHZYdTVaSmlPMFJ2MFl0dmhlVW5CbmhMbEtCWGIzUjF3Mms0?=
 =?utf-8?B?a1JTcEdXRzh4M2NkWXp5VTlPV1Y2OEt4QkJkSzhhaTBqZUtvVlJjTS9mK0ZO?=
 =?utf-8?Q?78WibgkamXnhNa22ru19n5MhAtXoYPNjFGa5qhRWUmlOM?=
X-MS-Exchange-AntiSpam-MessageData-1: psSQZZoTqHeu4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c70361-6246-486c-5a3a-08debfa9fa74
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:49:50.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQyWRKiX68ljj+KHHpyuNEIytkTGfvUNoBG147zO+Pvzeaj943KNNqnWuZpSFyLAvNMa5xJrIGGmqimGG/lPEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> A firmware image may be either a 32-bit or a 64-bit ELF, and callers
> should not have to know which. Detect the ELF class from the image
> header at parse time and dispatch to the matching parser, so a single
> entry point handles both layouts.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     | 22 ++++++++++++++++++----
>  drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
>  2 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index e4dcc9a87b7e..866bc9b3571e 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -629,14 +629,28 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: =
&str) -> Option<&'a [u8]>
>          })
>      }
> =20
> -    /// Tries to extract section with name `name` from the ELF64 image `=
elf`, and returns it.
> -    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option=
<&'a [u8]> {
> +    /// Extract the section with name `name` from the ELF64 image `elf`.
> +    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> =
{
>          elf_section_generic::<Elf64Format>(elf, name)
>      }
> =20
>      /// Extract the section with name `name` from the ELF32 image `elf`.
> -    #[expect(dead_code)]
> -    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option=
<&'a [u8]> {
> +    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> =
{
>          elf_section_generic::<Elf32Format>(elf, name)
>      }
> +
> +    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
> +    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
> +        // Check ELF magic.
> +        if elf.len() < 5 || elf.get(0..4)? !=3D b"\x7fELF" {
> +            return None;
> +        }
> +
> +        // Check ELF class: 1 =3D 32-bit, 2 =3D 64-bit.
> +        match elf.get(4)? {
> +            1 =3D> elf32_section(elf, name),
> +            2 =3D> elf64_section(elf, name),
> +            _ =3D> None,
> +        }
> +    }
>  }

What about adding named constants (inline in the function) for these
magic numbers?

The elf.len() check looks unnecessary since you are using .get() and
returning an Option rather than a Result. Instead you could do
`if elf.get(0..SELFMAG) !=3D Some(ELFMAG)`.

With those resolved,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
