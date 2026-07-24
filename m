Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020076.outbound.protection.outlook.com [52.101.196.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38803B3BF3
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899408; cv=fail; b=mVZ2VD23vkD8Qm4LghQqna45JVviXf+BYmkoBSkzHz9M8ElXiDW9hggcBOZIdMnEr+RGi+cXi/Htp1v9ON0aX79EU5uZIhRwo6tiiAaGVaOxZ8k7JK+urv71znaVO2K4Nd15pTXapg+6MOhxH38G0ct42JF9MsoqCAqylUDGSyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899408; c=relaxed/simple;
	bh=EN/Ti2tVusEb6If2fkkeBUUSXeIdKvQ3t1Ov8k2m/c0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qaheuDHyktHesWtNrPYUTpslf08wxUy8Y/mVEh9oaPfILUFFjrxjE7Ekf+2N5mMES1G7cIpYDE6Uu3ja5oTFRiTRYh6420xKzZ+XfAlcGf2XqEMRUrZhr9orSs97aVCEYMsrKQhkx55TRMOyY3YVl60EpS9b7QbOY7XC6nf7114=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=i1THjBST; arc=fail smtp.client-ip=52.101.196.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="i1THjBST"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACkgZ8iOG2DCotQWNZNk1aCZRDnE75wKqx6tVGuYpGs2phKPRMI6lXD77j2sdGLGoRwWXMgIWee1ZPRDj7zA7Hw4usbywRjcuMvu2zQEMiU/Uvcx6uGTsVektubdOr17BAqvwIA7YJBxL+74w0EcP2RLeTho3b0BHBNXqN8wRmBRiEmKkFzRNQdNK2xma51iikceC1sZAGljVQplXNp9XuQnpU1WS9BOfGm0yA//qU1QLY9FrelRwBVBdtTjg0F04jN+GOlEPhNEaLhh8sk1Y7lfhl9xppog41lXuAeiNpl8Uo4dn62AVFKDHpx6kNupuPIXHS1ZHFN6CVt3VAiXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VT43YfgpzMrcvAmvBd8E0dlWvLO0qk9/wsN9Yo39h4=;
 b=lINoqjRlTuK+6CFpsy4yfiP//Sw+kNw0uwxHa/VsEDklBKOvzM9ANlqOvfXoWDa8+uR5L2b0pqCcGkVE3G82gxIwLaSi3JbbDpBCIDa0Wudnwz37DnOGXpfma7dUrq2Jm/QZSrGrU8uarnuUr+winx1rWKSptfud6NGb5WlA4RoEyEgV8vhLCY/Q9GXQ6i3r/6fr9xCVFV/Go8AUADlfbeNC2m4sWsFEyjvm/Ft/3+wDYoArR2Qp1PRyUK9s2XffCnlYP/Tk5z5VdMBlqPfkJl02YUEB2Nrcl/sYKMTujrWzp14Wdw8V9j+y8UbO2d95on0/NM0ODv51NFyYhblwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VT43YfgpzMrcvAmvBd8E0dlWvLO0qk9/wsN9Yo39h4=;
 b=i1THjBSTxbRtHMOU4JeGs9eWA3LMuM+7c0p64KjQl+ndVj514XEcl2vtxQCwBGG/eE8Omjt8Icp433RJ7yQLh9oQGIY64ki43zblYOQ4CpvDCEut00vHfOUMmwU1cIVVQreT/v8SlVcpAFWbH/d5tXw7PqS/xR7/pHapluYo9UU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2237.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 13:23:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 13:23:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 14:23:23 +0100
Message-Id: <DK6U16CA3L2Z.1M87YWGIPFQRM@garyguo.net>
Cc: <ojeda@kernel.org>, <a.hindborg@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260720035510.4048145-1-tomo@flapping.org>
 <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
 <20260724.130853.1719089301624801198.tomo@flapping.org>
In-Reply-To: <20260724.130853.1719089301624801198.tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0343.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2237:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2a8f1f-d0d0-4fd4-3163-08dee986bd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|7416014|22082099003|18002099003|5023799004|56012099006|4143699003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MWhGgm7U/X/e8GBbRqCnwA6HgHoM+8uwQM4XwcRisFEpf57TbdWxnRujAgtztsKPwruKcpYcBdu82VGIhpZCsAJj9JdSCL214AUEld/OgLpkYejkSeMQqlbZV4yDJUGdG1NcjzNsa66krB3DLg/R3RuccsHbgLB1l6LiuwYTZR7pe7prKJvjDy1glDtICAS5JgUuEzkQ+xYlGSZPUy95RlHZX+f4yVL/yyHtaXFsVzaHsl1IiRClHDNH4CuhShPkNj1kUADkU5LMrMAauAkur80/E7RbnLkqK3Ja0fWSTdKiVVdbdIZvnz82YRjcDYjg4XrresrspJBGIQskA9QXThdX1c4u4q3DAPJ5DuG0VqC1Q3yVAjEQaoJEFv2Z2bhLkTCgKMHXZ3Qebp/JSiWHucKXisLzsRuqdhAbqLmygiAAxSv4ttuDyMtrQxSVyYn12bNQiBs78zOBNxXZjcyNt4eEww+V1hyafmaRgf/X/4Hg7OMBrmfhYHtNzXVE8S7UyG3NHPxuuYHyQAfkV5Iy9nRnMTOzgEz0L3JECxOswy6NePl+myQnaHe77/BY1i3vD4BZCaJZpktyY9Tq4qUyIL/hc5XXowQoJLOSfD6KSGHnILNtymQmBoc0tAOZuYevBGETfWslltNnXRTPiTRxlzCt2JDyN2qt+V66bGQsCFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(7416014)(22082099003)(18002099003)(5023799004)(56012099006)(4143699003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU80Zy9WaDlreUNySCtaTVY2cTYzKzdWNHd5UVVnSnduc2g0SnJXVmtLdUlC?=
 =?utf-8?B?ZnV1L0lpM3IyNFM2RUtrenVXWFpXT0dCUU43bkxYZHk2cDZVWVJvWDJBT2RR?=
 =?utf-8?B?TzZ1RmFYaGVFSXdJZGJTd1NyZ2VCTUtmWnJMelVlSm5wWUpncktqMDRrazQy?=
 =?utf-8?B?aVRSZHNiZ0dBT09tbFN1T0txZStGc3cvOFVXT0hkTXo3QTA5V3V0SE1nclhx?=
 =?utf-8?B?NG5UKzV1RndjVVJ3S09DVFNhS3MzL3JKTTZPUGZyRzZXdXo5S0lTdFZhdjZy?=
 =?utf-8?B?ZlZkOGhxejFZUXB5aU1kYmMveUpZVjNNMHlKdFJxcXV4VDBuZTEvWXhTeUhi?=
 =?utf-8?B?V2dkT3luSG9SMG5PcndzZnhXdVFPdFZGejJrLytWNGViWEFVRHRVVWxma2JB?=
 =?utf-8?B?WUkrY2szTE80S1grU2NBYU5NQVFqTnowOVpPekJ2RExLYlFtcFFlajhRRm5Q?=
 =?utf-8?B?MnVRQ0xTUXZQMFIvaWVoMS9ZR1BLTmxHRGVtQWEyZ0ozc2NjT05pOVZsWjhk?=
 =?utf-8?B?em8rSFNrS2dsYUpRVm5lSlJUVjlHRjJ1YStsQ3M0eHU0aWwraWdZWjh6Vzgw?=
 =?utf-8?B?WUJyNUxkbVk3MXROakZpdmRXZXVycFozVktaRmFFekZrS2tja1hMdUdiOWRy?=
 =?utf-8?B?YVdmb2tkbGJRM2p3b1ZhRldqOFoyR0hmanFIU3l5c2FkbUNacTFWNlBnVmM1?=
 =?utf-8?B?QU1jRXR5RmxjWnoxTnNWbXlnQXlOdmxuekl3bmJFK1ZHc0RsSzYwMG8xNEk4?=
 =?utf-8?B?YUlheXhUTis3WkFzandCT25xRFc3ZXhObnBDRS9jSGNKQlNTYlpGdXhUMFkw?=
 =?utf-8?B?L0Z5a3Rxbktld1BVOXhlc1drLzVBdUd4eTEyQ05iVXM4SlltV29LVGZuWHFk?=
 =?utf-8?B?dGdwYXM1UWhtNUcrWFlqVlJEUGZ5b0NiQUhNY1d4cmFaSTdMd3BFRTBaRkVG?=
 =?utf-8?B?K3hCY3dCZ2JzVlo0cXVHN29mUEIxUDlJOXUxMUV6TkpaeUNlbXNEMDNBRTFu?=
 =?utf-8?B?RXN6aE4rWlFHaU5BcFRrT1RwQWI0aG02K1NzbHV5Qm9SNHBYc0lON2FoU3BR?=
 =?utf-8?B?WHFoNExXcGhBaGFWZ3Y5eDVkVFdka3RaaG5PVjB6UDFncWRlOHFiOFZJd2cv?=
 =?utf-8?B?L3ArdGp4QTllb3ptWGJDY25JSG45QXJLMXNneG5NeGErVFNkNUZDTEVJZXov?=
 =?utf-8?B?Qi8rTFM5ZHVjREN1V203OUhuaks1OWt1M0xFbnNadGN2cVdsZnNUZVc5UGpW?=
 =?utf-8?B?U0VHQkkyNDIxajZodTRIMkY0Y3ByemJlR0ZSS2duZVRSWi9FT3MxelRkMGtP?=
 =?utf-8?B?emErdzl4L0FHMEdzTEZBOTM3U01qc2lMcit5WXoxZEIxejQ3Qlk1dEZnTXl6?=
 =?utf-8?B?V1k3Q3lRaGJ6aThmSytUbmtRWW1XUVVjQ3FvTjdRcEVhUU1KTFNKOWpOOVcv?=
 =?utf-8?B?ZDdvVTlWVTFnVnF3K290SkIwTnJYQWEzbVJla3BDOXlLZHdZSE8zems3eDB4?=
 =?utf-8?B?ZVFPQ0k3bmI3UEhJNHJlUUlIRm9ZRzVyMmdyajNLNy9nMFhYcWRLMnUxQTFU?=
 =?utf-8?B?ZWExZzBQTnFEYjJqdkVZZEkrMkp0KzhvWnJLWVRlSXE0WUVnelNvSXRKcUZR?=
 =?utf-8?B?cFVmQ2p1b3ZmUGtlU0dheVVnQXpVMnJaaTczdVJEbWl2WnVyL2x1clBFemVv?=
 =?utf-8?B?cHFkUTJYSnJQZ1NaZmFrTGZRajVXZXRoRDZRejJQejZ3RFZ5bk1XbnpGUXRO?=
 =?utf-8?B?NjVNRTBEQnJrM2RjL0lrc3pNRnlYcEdWYlg3WUJ2Wno5cVhTUTdQZ3lCUWZv?=
 =?utf-8?B?SkhMeGF3WURqbzh2VkIweUhRUC9JQ1JjcTZLUDU5WGdHbFh0M3VMczNUVm1i?=
 =?utf-8?B?bEZ3UElEYzR4cEtIc0w4WVNQMnhtSnRDVHpxL0Z1eU1kbHRaRERpYndrRko1?=
 =?utf-8?B?dmJRQ3o5R2krS1BPN2w0elRRZnlNY0huUm15enhrc1BqckttUFo0YTNYbEts?=
 =?utf-8?B?OFhLWExhSGlPYkxrK1dyT2pVdGxUSysxV1VMbFlTdlcyRG9pd05ySXJqakVy?=
 =?utf-8?B?dHc4RXFZOEZQcVRUeFhyeG5mNC8yR295ZGdoZ3lhTE9SWWN4MjRVZWNhVTA3?=
 =?utf-8?B?c0lRZk00OStHSVluZy9ySzNJbFc3akRlbTQwYjFoNE5Jd1l2eUxLMTF2VVhu?=
 =?utf-8?B?dERzMWMvNG83SEJ3QlRsN3NSV0dVK3JOL2dCaHluS28wbVdvb2p3elN6WExI?=
 =?utf-8?B?SERhUkVTMFFLcnhYYW1xcmV1Ry9kNCtDSUVzakFoS2swYmFJdEdqbjlJd3RJ?=
 =?utf-8?B?ODI1dlBPQnJFWTlMQ3NCT3JYdG80QWdJbTUvaWw4OXRvdlQzbW5BZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2a8f1f-d0d0-4fd4-3163-08dee986bd43
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 13:23:24.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVTMCRAPcf2gHiYabYPIwj7qsq587KDByOD3LlV58nAyL+LaqJGhKpFfmLu7YJ7Mv/jHCKX3ljmTISjknAGr7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2237

On Fri Jul 24, 2026 at 5:08 AM BST, FUJITA Tomonori wrote:
> On Fri, 24 Jul 2026 00:40:04 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>>> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
>>> index ed943960f851..2fd7ee25abcb 100644
>>> --- a/rust/kernel/bug.rs
>>> +++ b/rust/kernel/bug.rs
>>> @@ -123,9 +123,9 @@ macro_rules! warn_on {
>>>          const _COND_STR: &str =3D file!();
>>> =20
>>>          if cond {
>>> -            const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag_taint($c=
rate::bindings::TAINT_WARN);
>>> +            const _WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag_taint($=
crate::bindings::TAINT_WARN);
>>> =20
>>> -            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
>>> +            $crate::warn_flags!(_COND_STR, _WARN_ON_FLAGS);
>>=20
>> Hmm, why bother adding a const for this rather than just invoke
>>=20
>>     $crate::warn_flags!(
>>         _COND_STR,
>>         const { ... }
>>     )
>>=20
>> ?
>
> Ah, `(const { ... })` works.
>
>
>> Also, the proper fix would be to mark it as used in the `warn_flags` mac=
ro
>> that discard the expression.
>>=20
>>     if false {
>>         _ =3D $flags;
>>     }
>
>
> Yeah, having the callee that discards the argument consume it is more
> logical than working around it at the caller. I'll send v2 shortly.
>
> The same reasoning applies to `$file`. Since there is no warning right
> now, I'll rename `_COND_STR` to `COND_STR` and consume `$file` in a
> separate patch for consistency.

Given that this is closely related to $flags I'd do it in a single patch.

Best,
Gary
