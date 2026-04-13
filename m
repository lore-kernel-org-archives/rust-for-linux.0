Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7392D7D59
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 04:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053486; cv=fail; b=EQPyRc/xVGJTy5swtXUn7PxXXzEAyGkuMMBsEdqRyOzJN2TW7XQo7g4mQfmCtVnFYkOBtOBhSEIZYqySbyzY8sHvgoOFMP1ccH0wJTk0Kd9WGExRAjbtvefWstc0f6wuuCZHNz12LbPx4irhIev3rvVfBmaF3qvuOGBAytondpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053486; c=relaxed/simple;
	bh=S7nWIBDMuzqIxhLwgMlqCR+tUaL/rBWNK2h3EWuJkpQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lkH0US+OsY/XxvYOh8VvHV7rVCsN7Ka1oV/ViUOI2pTLQAi2Qah+uqohh7JvhjU6oAJFFwcoEaxJ/E3ddv7lh8LyhYwQL3gucsatNx1PuW2l7gSDUFCAB0lHuWAknuvjwU8Ij7CKg2ggD/WETFZGuS0Xt0Ud+A7JtOqcXdHl4sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rs005ca/; arc=fail smtp.client-ip=40.93.194.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rs005ca/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+Z1FXzPdeUs5E/ab3c+ZK5dp7l+P9Bgj9QnD2eykO4v+COGu8Rxz1fSLo7xV3drXYLkdKYvwO2u8Tvwf2I125zJW7gHoSwZ/9ZDBv05FyoMzLIptNorj/sKpEMc/YdQWHpFAa30zKzpvjE+XHhYw60MyNct9WI4LkF1HrpkVDE5onnYaJzVRsG56QiKJZIKmnLM22MIDuwEdlLZaWeX9TBZPr2bC8y/MbydU9zhmIm2iGtEIxA1GUiCqRb3p1AyDu7qjh4hOQ6htrea/8YNSxN5L861Mjfb1YSPrZnmwMiWl7vqCrSZgrJs0RjLPErqORNVZ4m9wGfw3tnyjolFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In2A3MfTnWozQ7V9WhPP6Vtgc/XGW/Zu61Cjuc9Ysn4=;
 b=DtEAj68gZVKfWSYyg5+ApMSQz2f5uv1Dam+8QwBxwpTeXYFvHo8t53QKEPSZ7ziqIwjvj3h7xiMUdOD57M6PT1kC3O1pScXyLogk1Wa9aEr+aAgMKek+fIHYH8VxD8HY6ky4zh2TAkxaxQBFobJzUztM6ygyvI0GNxn6vtSXMtk5C7E9hNdqBg0t/N/cNE2yp5aVFivMcAC5TvlPXl/FC3kZPbeBqTaZS2BNpnvIkhgAI/1hYIv+9a7IAuTHpX3hSUTNTsnBIV2KBVOTIyjD8n5xI9o3+w0mu7FwtkvxVpPNvSOziEO9cE5qd7IZzAYccj9vCohSlGtNopjfZMD2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In2A3MfTnWozQ7V9WhPP6Vtgc/XGW/Zu61Cjuc9Ysn4=;
 b=Rs005ca/EV4nPWfwE0nhUqi9tPTnzHnQQr1iV9ZYmhsW6tcXtzUaYo+TpFFZ/Sz39zVfm0GA9Q/VD4cSZcGzJqXfU3SleAN5vBOdqOBEW/KOZ9+FQEECOY5BR7YFcaI0gtGFaj3cHRWVkXrYXJ3oUj51QTc06amAtVPWsYuYIp3o2gr4sqMVHBn3UBmao3Xrcf302GEs3usDeP3qDV1zHz9wA71oPI6sjLTh0ybUedpLn4w2hKqB/WwRBAhTtwwTHm9rM8YZd3iJ5tMRST0Id8RPGXnPLVNjcoImW5LjNeSRRY9CxxzO8sdCLw914nzpFCIDgGIIWHl3uFbTpDMhbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7868.namprd12.prod.outlook.com (2603:10b6:a03:4cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 04:11:12 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 04:11:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 13:11:08 +0900
Message-Id: <DHRQERLRS06D.3STB1JIWGI759@nvidia.com>
Subject: Re: [PATCH 2/6] gpu: nova-core: do not consider 0xBB77 as a valid
 PCI ROM header signature
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-3-ttabi@nvidia.com>
In-Reply-To: <20260410203722.1586938-3-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab0edda-da31-4b1c-721c-08de9912b2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eJsqP4Qi1Fw7b4QaEjuKcyLg8hC+SpihzF79oySJbh45L3lI+N63IfVo03c4LqFSZ4ECndfZ37bSJeq+BWwRobSvRwyQRlWitzT/v+TmsWwqFOd3w3NrR3XC3daC6UFNTjR5hh/vmioIjn7X5dZgZ0MMQeYRs+ejx37FKIscaKZyOh6iKnXh9ZjajFBpwUylYHLozK1J5AgNIUSWJ+8Zy52/UAoKM5uC5Rnk/U71W45ZS+sW51Jx+ccQfpeCDYQMhHVG8Pm5QEre9I5Ya8E9GGmbTC9iImxt20GsqmOtcM7OSm3XURSFHGiIqVIpqMB7WBcKmYtyu0c+YLYluVOwpQMCFOykG92pC8aWmabACXM30dt0OucoHrYpQCCDSTXroSc5NZQawRlLOxwP8oTfDYqo/FMjt+y5zWNFrZuyqf0LqVcm+NTdKXRzwvQwRBOphu5tnY02mW5AZxhh+ObFpk3O1maL1C72grZnFET/GveB84PO2uyTIr/hZjxVYjOEIaVzdOy5LvSSjC01njCmuulj6R/REOVWljPruEntttCR5HacN8rhQmZCR8+HS1wv0mFcOdbMvJbkn2UrEKbyGg//NKfJ7tim7wKmdRDFsHi/HRfk52EM0muNQCoYtLUZqaXor9G4yG2VvgsTC/ZNlekNCHw9+oelMFl0xzf286IJZjMxEIfRTGqA4j7rhlHBhlONKQMGcuLgTUQHnOa/5r84X8pF5W8y2J9R+p9XPxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHFlN0gwMkFuYmlhTmRBOGNrdnlNNVZrNjhjK041TWlZUWlpMlBHRXpiSWVr?=
 =?utf-8?B?NE95dVd2d2V4STFLQmt0TkhTRmxlclZvUitISFljSnN0cWtZRnpJR0w2cHcz?=
 =?utf-8?B?UlZJY2ZUcjQ5RllGVEVsaWlTeGdmRk1leXFPNndyWGtYdGM3L3FKNEZ6TUMw?=
 =?utf-8?B?Q29lckVsUDF3WHF4czhWMlNhOHF6QTZiT2lST1A4MnBVdXoxTkxwRS9HL0hP?=
 =?utf-8?B?L2RSMkVTNUwxYjBEc2xtcldrWVUzT1ZrdWRuQTZ6eWx5YnpUeTFtVjJDQWhH?=
 =?utf-8?B?eXpTeXhzdVVxSVlDQjcvdlpQTHh0a2pITHNSVEswL21TTENJdkd2ZzlrRTZx?=
 =?utf-8?B?VUg3dlQ3NFVVamtKZ1BZd3drcDZpblE4R3RPM0MrVnQvUHk3YXVjNm8zY3RR?=
 =?utf-8?B?MWduTFZsblkzWno0cUd6dUtoclBLb1Y1OEVHZnY3MFZSMUU1Zi9XUkpYNVp2?=
 =?utf-8?B?YUxFRXFFZ2VIWHh3RVIzN2xhcUE4eVRuU3RsWkdXSU5NUmJmK2hTd1NLN3c3?=
 =?utf-8?B?S1JvYmMvM2Q2Mko1RHVsN3RLZm1YUFdpZUFUUk91ejlNRDNvSU55OHd5Tzgz?=
 =?utf-8?B?Uk5DNkg3Zi8ra0lHeVdFSmhNa05adUVJMjNkL3h1VFF1QXVZTTlvVGpQV3lJ?=
 =?utf-8?B?bG9YMTI0dW1rZ2ErSTBVNUVwT3lQREw5Q2FldStXdUVleE5wTjN6c0xnRWlq?=
 =?utf-8?B?bFpNNGRxdFdVVjlNaUpHaGVCbzl1elc4WThSSFAzMXRvNkk2U24weW5TMWww?=
 =?utf-8?B?SUVFYXE2Z3FyYmsrMjhhQk5NUFJBQlBtR00vQ0ZDS1doeXhMSVUvZkFXNEJl?=
 =?utf-8?B?TFFoQ2VWZjNadlZncXcrZzR2cFRjMUFkSzdQQXc2eFVCOVBrOFhwL1JONWZK?=
 =?utf-8?B?bTl3QWJOalVMcHFtcytVS2hpeHZUb0ZKK1ZRMVlnNzlzbnhVdlJGbXBlMHBs?=
 =?utf-8?B?cmlRd0k0VklRa3U1b2xHUVgrWmcvdGVxa3JDQWNUeG8ySThWWGV0bUtFcHMz?=
 =?utf-8?B?MkZLV2VyekJWRk5hWnZzSEdsY2lPM0VlblB5YmZVL3p1cmpJckNWYkNFaUVy?=
 =?utf-8?B?dVRTWlo2MENkQ0dSbTdQQjV1a2I2ejFkOXZUUFA1T1hYeGNHcGRLeTFHM3dD?=
 =?utf-8?B?T3RscDVmQnBlNUdzWC9pWndiNmJlY0Y3M3NBWkxPNDRnQTlJYUVzR2JvNWkr?=
 =?utf-8?B?Rnl0YXZaaVFMS2sveWg3cXR5aldRM3BTNi8rUVcrWUtUOGk2SERzUmJialB6?=
 =?utf-8?B?TXhDbHB2aUJQUWxMZlpKRmFKM04xZ1E1dFVYR1lNQUxydzdsUnRzalZRRVJV?=
 =?utf-8?B?V0JhVFYzQklGQkpzOWZ1NGFBRXAvemlFWUtRV0hnZ2lnSVRnUHU5YnczMEx6?=
 =?utf-8?B?cUdzWHBoMGVtREdtTWRBMmp0QWhhZ1lBZk9OWm05ME90VUlYbXcyUTlGK2w4?=
 =?utf-8?B?b3pwdlZtRy9UKy9lMVBMZFFUZ1Z1Z1hQc3J5TnVuejV1b0xOYmRlK3pRVHhT?=
 =?utf-8?B?NHQxV1Q5SnR1ejNkeS9BWUVCcFNFdDNsaHNhVC9FUUtsZmZDSERTeTFlL0lT?=
 =?utf-8?B?ci9TcWRCSk5vcW1TbFQwV01SeUlxbXFhWnlEaFJjWDJ1T0FoSkVrUm92WVFv?=
 =?utf-8?B?d3BmUmxLeTB6NjBqcHcwOU8wSElkdnNUNTF3MUdlYWpHL3c4Yi8wRDcrZmpz?=
 =?utf-8?B?eXJRTjVVWXZSc1ZLUG40ZlF5Y1k0Y0U5TFBody80Yk1jNTRra2pSbHRNMkFU?=
 =?utf-8?B?Z242azRtWmFOOVVDU3drSFIwYTlic1VYT1BUaDFKWW05ek5YQ0tNSkRBeHgw?=
 =?utf-8?B?c0RNQnZHem1BZ2NQZko1bTBQcGtnYXdHdEJUb3ExSVM4TGEweHA0MHJVT0FD?=
 =?utf-8?B?bHREQVVoUnBheWUrcE1CWG1qMW1rMHJib3l1dlpYYkwyZ1kxRGxuZUFhUzNo?=
 =?utf-8?B?ek85TSs0OG9XODV2SDJGRFhISlB1OStORGNraUlyUVBGcTBOTzQvL0swNHBM?=
 =?utf-8?B?OEk4eFBSVSs1cHBrTGJYNG8xdXhvS0dSMFRGVXUyY2RZUVdxRytYaFM4Q0dI?=
 =?utf-8?B?S2xjY0cwZ1MzQnFFMkIxYzdUaFRUL2dmNis0Q21qWWpTMzVucEdlZVdSMEZS?=
 =?utf-8?B?YTdhREd5K1dFaFNuUUw2dXNiRjJZaXRIMFhONXdBbGtrWmlvbzM0Vnh2ckdn?=
 =?utf-8?B?QzFIN09PRVpENytPa3BjYklWR3JyaVI1bjVmN3JNbnhBa3ZDckZoaVE0cGdk?=
 =?utf-8?B?cGZOQ1lLQysxZFJOZmg4ZTE0Yk9GSkVubkhIQk4yMWE5aGRhZ3RyTjFmcVdr?=
 =?utf-8?B?eExkcWVxbE9jRjB5WUR1MnR2QlRDZW5YSGFNMmtSWU9vSDRHZnZ0TDR4UlJW?=
 =?utf-8?Q?Y1I7EX7ArENO7zdoEyaEdDSmhRrEEuwBO5Fc9Ai6HMMli?=
X-MS-Exchange-AntiSpam-MessageData-1: /JiQQBj/QVYeRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab0edda-da31-4b1c-721c-08de9912b2d2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:11:12.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c69GR7nzPbEwRMB09HCDM8vdCBL3fYmqLZQi+bk8gTt5AMRoHITiRHI0rIN2Qjnf2Cg3x51wiM5eJd37NYpDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7868

On Sat Apr 11, 2026 at 5:37 AM JST, Timur Tabi wrote:
> Nvidia GPUs have some PCI expansion ROM sections that have an Nvidia-
> specific signature instead of 0xAA55.  Signature 0xBB77 is actually an
> internal-only value that has been deprecated for over a decade.
> Nova-core will never encounter a GPU with that signature, so don't look
> for it.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index ebda28e596c5..e726594eb130 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -491,7 +491,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<S=
elf> {
> =20
>          // Check for valid ROM signatures.
>          match signature {
> -            0xAA55 | 0xBB77 | 0x4E56 =3D> {}
> +            0xAA55 | 0x4E56 =3D> {}
>              _ =3D> {
>                  dev_err!(dev, "ROM signature unknown {:#x}\n", signature=
);
>                  return Err(EINVAL);

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
