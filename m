Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C416132A;
	Mon,  2 Mar 2026 04:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772426688; cv=fail; b=K9zDbSZ4NHNaMO9lqw64zhCNSDCK59qmEWz8mb7IbRpYuM1bJ3ha6/rJ8nYIOziTOgAp41DVbu7P7kbVu0EwGVLS744xSl+lP5Paoy79F6D51i9TF3V9K0XpPi+Ix9K/X31efdpe1v4bWDukEwnEDqLilgeXx4P0fsbie5DeBoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772426688; c=relaxed/simple;
	bh=wxe3Wj8EFo/1xLESg484ICfCR4zsMfB8qXxli2KsYv0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fI4vU/3VHEIDVNt8BdkGXSZFXUmCqTa4FnuBDI+YBAiRpMSx9St13L8JXjEw1AqUaGh9ch28OE/AKfxjUBolM4aMbHU+4uXLRnC2zRf7fzFmqz5FM3DlyuM7jua12oSHoXCqenE+JKEbPDDXn8Z7mow+mFB/K3CCUYd8vbK6gO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WoeaDzBB; arc=fail smtp.client-ip=52.101.85.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WoeaDzBB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1rJ5EFou0jDQFS5a4K7eqUq+wdE+FKD5iqP6ltzoJMi0WE2HnUGYcKQZab1AmR/fpYwRmmBUPpVRo2qJApou0GJmc25GupjAyG3P+zdQE1LAsvUZesduLWRMiKFPU8tKh1fXPWoAFvU3t+odZf3Z3iWbYCD+tWAGGLM1athPTfJY3tWSB4az8RNC5blfRksWlgUk4NFpqVieWRETBYcNVT1ZUF7/TFJWnenrj2dkfTGC8rZbk/5w5kY2uQZcRa+zDtUpiGT4zw9+T23PbZynx9T8RgsemeLwHmMcti8CDnjO50u9DJp9fnzCOgfrWKq/b6/1Kqv31DsLJcvSKnw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSivwxcgMukNy4O+CkgEqqJdmiKRAZMO3EcgS3d+neI=;
 b=prJ4I0vRAz/kVyKJNnAvePCPepmBB4IjBwo4iCGdobfHBRQeOmDDUUJOiyoq3HUAdiWC17O2kYr4B7ytjDQx4UBmnrQPDK5ZdzCebGAstRSrNj1gVoKoPdgiDxZpl2sJXDTxT5+Q9Q7VYmNk3mfFE+zrIaTJVHT1mC7OD1u3pW0P2EH7ZTJ+1cf/WRvFDW/y+foHqBIGcCx63NR8ofyvdKfrsO7K5+MeIIdgJNWnf/nTea2pFxYQxV/gkkhOjK1ZN/3ph2sFXXS8Gvxet6Ql3Pia6j83QliDy0/PbuwcpXfEFg1RfMoDhhmeJu/PM5BSK4tKsGHt9hjXyGJ2KtprMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSivwxcgMukNy4O+CkgEqqJdmiKRAZMO3EcgS3d+neI=;
 b=WoeaDzBBbsIZGgyLa0OEUjkUCPn/f6RyRvOcQgzzpfldv/WMGwtyKVB8f6KJjOa300I0HC0gaqYwP+Dn/44yQzHtg9SzSPx80UVxd7QebdouDWYLvUWp3LTEOGCv8G7aTBC1+Y8njXXzzK/mXZ7yRqMO3m2gtbJ8WcWlK5hkD/5orDsaTQt5DcFmPeKXVznAiwGIyEm5eNsmnI84uDfs+S/2qX3w58WrTrwCQSwOa8grybxnFi3NP7bGHbtrMJyC+nKdcRoOOKIGDQSxl5zVvRvjmELiCWgkpWFrzukksD6vmiIG19E/1ir4G4mJ2QQrs7Bd7A9Kq1jraG8BI0Ocfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 04:44:40 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 04:44:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:44:36 +0900
Message-Id: <DGS0TID7DFGJ.1SVJQZW2H5D3X@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 9/9] gpu: nova-core: gsp: add tests for SplitState
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-9-572ab9916766@nvidia.com>
 <DGPPM80YS5P8.3UOZ42Q2O8U3G@nvidia.com>
In-Reply-To: <DGPPM80YS5P8.3UOZ42Q2O8U3G@nvidia.com>
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec605da-37b8-4a61-0ba7-08de78166a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	j99Eg9c+73R+ERphWPV6OOYyTMbowYxV5JMxifY/GzK7y4/lNGjPxS5cF3QTicgQGsFMupCpCtDb/2SyF6lXCYTP0yIfkw8ADOv8AhnIJlxlitCSCexnekl9gIRYpFwHUvOIXYBknD1qegNn+sddZy1xe+juDX0ocOgmPAAsF39RcM/+W38xQM62eFQ/vaDTXoh1AvDtK86Bm7+KWsBOxbQYDcvERs5Jo0w9PrzM25tfgH4xIEmWj3MiXZ/92zq1tkKLFbjWbOpSZiuFn87uzBfd+HXjFd1iJcEot3AfnEjLCEwsCSknBB6aa8kpcjdcuvhxrhMfs9/CaTloyX0ZuFsEXyutyN1chesBXzDl/VjHewUS/ehSmeNGOaxauErjYvPjcf0OgOhNBDqcD3QihNdivS2upf6AaCe5CzNKd/qnslNS7Gh2gqeAfuhFd1qMrQtJSWAAghVxnSTeKUW8ouYlNC6DbUNQ5n8NsQZ11xX++7+w+WQpt4tMDyCdzBHoqYS1ViqH9uLKUEBZD/F7UQ4UGoNbPEUDj0TZqJ2UcxHQc1sqqFEEk4Lp9A1KyWtx5ApUHxm3S4yz7V3+L6DGUhmM/gKTgMepNVAbZnCwEvGJFhEDkx4S7lEqsKv4zpp9ljrLzGuOYiWn28b6+rrhSjPc14G0GLvcE9Z+AlqFVDs0MEzeqTaW+JFw+UXDqr9nCtcucDautfmA0o9qMdMRa/cdiDA/QRp4SjJY6rhyKDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUtGeEc1YTk0VjJJNG9kam5DOTk3d1g3TFhFMlZsQlg1aGpzZXZvU3JHMlkz?=
 =?utf-8?B?THZJQkF0SEc2QTdVNWJJSldXeVQ3RTJ0YlYyMVlwNXJDV1JWM3FsYThtSVE2?=
 =?utf-8?B?b05ZZ2NDa1M4aGFQN0YzSHRTalROZnRISVlyUXdBaGh3YXlJQTFlWU9ZMzgz?=
 =?utf-8?B?SnV2azZGbkUxQkpFbjRlallVQWQ1cGpWVG1NY2tLM0ZGUVlyYXdlZlNnNEdW?=
 =?utf-8?B?dGpRM1dMeVk2c3d5SUZtQkJwclUwUDgyK0dHbnFVVktWM2UwTU5zTFdJVUZM?=
 =?utf-8?B?ekZmWC9JeWhYUmlwVk13WnNIRWZ4TlM4amU3dXI2MDcwYW95MkMyT0N0MnF1?=
 =?utf-8?B?SHF0b0RXdmkycXNGOW9DMW5iUjk2Ty9rT1dQWk9lWVhrVnNwMXdUN0lmbXNq?=
 =?utf-8?B?Y0ZVWE11WlMzZHVtOTROR2FRNW95WEFCaVNIQnFFVlpkTG1rSDY3dFg2QzRr?=
 =?utf-8?B?bDgwbnlrYU96OXo1bTJNNGxPTWh5K3FkbGdERWpMVnR5V0ZJNXdDRm9RUDdD?=
 =?utf-8?B?N085clRXOERPcCtqOCtTQzQ4NUljTFNreFpZR3lWRW5wbWo5cjNWWUNOQjNz?=
 =?utf-8?B?RlJzZExwcmdJZ29TS2RtZGtOUDcvaTFDTkJubCswc0ErY1JVYkpMTHptcjQw?=
 =?utf-8?B?aXZXNDhEVlduWmVyQjQ2Skh5UWc1VjFtMzhSdzBwcUs0N3V1K1E3VzFVR3hx?=
 =?utf-8?B?eXlXMTk2ZndrdTE1VGRFSGRhd1U4aWtFZzNzT1dNRGR1MG5sSVlYSjhIZmVD?=
 =?utf-8?B?WjE3eTNDY3VTZ2ZsNGhSWFIrUmQ4T0x6cVdyMUwrSW85SkRBZldPUktxOEd1?=
 =?utf-8?B?S2VtdWZDeWp2T1Q0R3dKVTJrQ3FGNm9teGFxbzVnZHAvOGQrUHlrUHRKdDdi?=
 =?utf-8?B?Q0gxNTg2Uk9XNGd1bjJ3bGNIUTkxai9jZURJWldmR2RkelN6ZEE4cWRybE1I?=
 =?utf-8?B?Z2VUV1ZtNUczZmtsTHhDNzFTVWROTm1sK3FQazIrcjhMeXJ1TW5sOFd2ZTYz?=
 =?utf-8?B?VHl6SXFrRXNrMkk5OFhjVzRLNU5ycmVVNEJaSkdUVlZKeU1Hanp5TVU4bWUz?=
 =?utf-8?B?eThuRGdPZ0crMVdzbUdpQ0x5VkQ3ZGF2a0RPQnA5MzA1dnNIUlZBNUFzeEdY?=
 =?utf-8?B?cVdBQVd4ckF4OVFzL1VlYmhoSUNLMTJyYWRyNFZGaEZVK0NCNlFMdm9vakxR?=
 =?utf-8?B?Yjd5SUtYT2xDVUhmZzVTSk9Ba0hxQ3d6Vm5jZHlzNTBpTlR3VFozTnZLL2VM?=
 =?utf-8?B?MVd1RVZuQk1xNVkwbXlaSzViMjZWNE9IZ255V0c3YWJpRWd0RnZjN2J2UStr?=
 =?utf-8?B?d0VzU0NlRjZBbWdhRVd0WW94V3h6MHo3VzJLMHJJc29sQ1pzZ201a2o1RGRL?=
 =?utf-8?B?ZzVvaHBWM3hQSnlOV0VMMXg4cnZ6SXU0aU9VUTFvbGZ2ZVl0L25xdElISTRD?=
 =?utf-8?B?a3ZBZms5SnBzYytlRndIMy9idFFtMVZuOUFqVWEzOGdHdFR0N1M5QUpwRXZX?=
 =?utf-8?B?aStJTlZ3V25rZzk1RTJVVXpvcG9vQ09ROG9wTkRnQTFNSEpDV0U0Y2Z1aEx5?=
 =?utf-8?B?aDB6V0RtVDJkdzYvSHBKVVFtT2dDQ2VuNHJ5VEFGa1ZaZittTTQ5OUI2NGNu?=
 =?utf-8?B?bnZ6Qlc5N1JsV2haMEJFTjU1dHZqeU9paWhwcWxzTmVjaVowSFlKQXBabGdP?=
 =?utf-8?B?R3VCVlNyUmdvWlVUbDI0TXRmM3J1ak0yR0hmQnRVOGl6NlQrZTd5aE02bURm?=
 =?utf-8?B?K2tNYlA0K3E4QTBVOGhMQURzcFRMMlU5S0hINFYrVDRtL1p6VU9DeWVWYlY0?=
 =?utf-8?B?U3MrdXpFYytBbnc1cG41SHBNZkU0ZXpYeGNIMU1GN3FWR3lpNjhicmhCQ1BZ?=
 =?utf-8?B?a0VDMTd2V1RabFZmNUJ5TGpQNzVyUk5tMnV3Q0hIN05zV2w5N0toV1VTd1h3?=
 =?utf-8?B?UVhZUWozSDI4dVNMUlRqWmhIOS9JeUQvcjhxU0l6VG9mZFRreVZpVmZueEFt?=
 =?utf-8?B?bFV4QnhQMmRFRDZESXB3NFlHQ3BQUm9JMnY2eG4zaUNVRkpNM1BmVE5HR2lL?=
 =?utf-8?B?cmFVRURScjdYRkZhZTI3NW1MUWtMTHJ3SGI1cmFsanFMODRMQmgwVXNZMlpL?=
 =?utf-8?B?bFVES0RPcmUrdWt6T1ZFSnJ4STdBYWg4YVB1VzBSOTdUczBmRjVET0lqTUNJ?=
 =?utf-8?B?NlRnN1pVTWJ4ZzhNaGU5UlJnRmNkRlU5eFhkbStQT3k1Zng3S0I4a293V0Ex?=
 =?utf-8?B?VXF2RHM5QnFhcisxRXM5UHhZWnQzOGVrSFJOdm11VkxFWmJrcWt3QW9wKzhH?=
 =?utf-8?B?Q2JQNFUvMEFMcDVNam9HWmVpTkFSU0xiNUxQVURkZ29ESEd1RzdUTVR1TUVa?=
 =?utf-8?Q?UruzO0sRKscK46EUxYyxlKTHsVmwQ36/WP3qi1I9lv5D1?=
X-MS-Exchange-AntiSpam-MessageData-1: eL7+2Yx1jiaYSQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec605da-37b8-4a61-0ba7-08de78166a0f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 04:44:39.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqqohGigoo8V3LEi6Fxxe2LF9qNKe+4Dm3qV5KzwbViEh4YBX+tjLcuRv2a9bff6Rn0OG92zV1C0hV5RmyBzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359

On Fri Feb 27, 2026 at 8:32 PM JST, Alexandre Courbot wrote:
>> +#[kunit_tests(nova_core_gsp_commands)]
>> +mod tests {
>> +    use super::*;
>> +
>> +    struct TestPayload {
>> +        data: KVVec<u8>,
>> +    }
>> +
>> +    impl TestPayload {
>> +        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
>> +            let mut data =3D KVVec::with_capacity(len, GFP_KERNEL)?;
>> +            for i in 0..len {
>> +                data.push(i as u8, GFP_KERNEL)?;
>> +            }
>> +            Ok(data)
>> +        }
>> +
>> +        fn new(len: usize) -> Result<Self> {
>> +            Ok(Self {
>> +                data: Self::generate_pattern(len)?,
>> +            })
>> +        }
>> +    }
>> +
>> +    impl CommandToGsp for TestPayload {
>> +        const FUNCTION: MsgFunction =3D MsgFunction::Nop;
>> +        type Command =3D ();
>
> Since we are testing the size of the data written on the command queue,
> can you make the command itself larger than 0 bytes? Otherwise there is
> a potential for missing errors.
>
> I'm saying that because it actually happened to me, I used
> `MAX_CMD_SIZE` instead of `MAX_CMD_SIZE - size_of::<C::Command>()`
> somewhere, and despite it being broken the tests were passing.

Yeah good idea, particularly since you ran into it too. Added.
