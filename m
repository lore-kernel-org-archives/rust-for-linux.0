Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020093.outbound.protection.outlook.com [52.101.196.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2F4582CA;
	Mon, 31 Aug 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196260; cv=fail; b=VxDbWzrbe03s+G1Cod+WwJUezRB0il3WO+H9OQcJOyI5//52lO3ZNkHt4Je6hdNirusnFNAPH0crfMfCMVJmRGPvqZuyLSSDZNG/bRZLsYMGIu5yZa+Hm7MpH1c9p7tmqi255KVvrlzmABKtto7VBmY9I2wbNhm5PEUf9OE1jqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196260; c=relaxed/simple;
	bh=szLd1FcbeT5AXkDSyVqEidfOYV5Hgx/N2de3p5GRMZY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=D53BbiCOPG6CJeINGF5sQxrDx9nwKeCx5XsiKo0B1DztAAhWjqQlJ0wlVxdlbIrDfonypDUEouarblG1uXmpsjnRi+ciQ5UKTzlCo39XFntCt//cjsCfJHIO0Thaotb5l8FmF/5YE0jogOCX3Ih2U5D7rCgPP/hayn5Reb9lHgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=aqoC4EE/; arc=fail smtp.client-ip=52.101.196.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="aqoC4EE/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEmgLQ4kLlMRwu4ZUSbVno8cApQ6+PxjKs49zTi8ZYisr8SOd4XArp4fsx6U2yTafDTO2JCkK1Tx2W3J+NjD9BN30wGbx82DQNgMkMVCbfJJ4DR4B41nKSBWB1i0J3cUEUytvyn9o30MXGEz4JPMLcVCJ6FpMMKeMqs+IQ8STQmkwsFZbnmKBXbTaJk2NXPbjtVbB9fNddqoSDVZGJhvxWctmiXULBr/mgv1rtiHQYIriwtDiS5n2rlYdna4xQY+0p9pAsUaumjik7BNWVy6zdXbGPWgu1dMAt8IInYgPpmYgEqMNrao9ohsYspandNJZsArfnAvjrRi1mR9B2YE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szLd1FcbeT5AXkDSyVqEidfOYV5Hgx/N2de3p5GRMZY=;
 b=DgEo5we7HAbNz7p0iOYzjJlWoBkjUHGeMT4p761GQzzGUBpICYg8HX4vyZbkmpVkWEAh+sKifQhUhvs+JbXU+u31Bk9L+eOTkLoaUlDWuZAQYFVd4KvTCPL2LWFeXRFg7wU0UNmGDsBOF+oDQ06pCtXU2Qst3+Xf1qVkKmQRXi8tiBnY6UuHCqi4BcPxQbo9A43Vlb04u2T25qvH34bx1qwv9ZyN2r1kpSdwaBol5Tj6TFudduc8aApayCld66wUkfE5MaqgUfmSUwhP75pg8rcN+IRsV6rsF1JbFUxJ7SbVDIjCq4tsDNQQFF4voLbnQ+hoQuuhZFs28E10JvUKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szLd1FcbeT5AXkDSyVqEidfOYV5Hgx/N2de3p5GRMZY=;
 b=aqoC4EE/FWP5tTznbBNq2cFZpnt2tAKOxygusM6ne7hnGbMGQCGxwCq08uF6J32InpvIao/Nl9Ay/XhobD6rf7U6IH+F8OI67AjZtc6CNZAxU4H2PpMPxXUAokGwjPDHx6X3BIHNk5e0TQicIEp27SWm29ykHBqU/BT5hJ3sU+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB9145.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:10:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:10:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 18:10:54 +0100
Message-Id: <DL3AO2K8IS07.3QB2IM7YJL8WT@garyguo.net>
Cc: <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <daniel.almeida@collabora.com>, <tamird@kernel.org>, <acourbot@nvidia.com>,
 <work@onurozkan.dev>, <gregkh@linuxfoundation.org>,
 <colinbrauncl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] rust: usb: add revocable typed interface I/O
From: "Gary Guo" <gary@garyguo.net>
To: "Mike Lothian" <mike@fireburn.co.uk>, <dakr@kernel.org>,
 <linux-usb@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260826163101.4168-1-mike@fireburn.co.uk>
 <20260826163101.4168-2-mike@fireburn.co.uk>
 <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
 <CAHbf0-EzHGuQ720V1g84U8Ys8HS+Lpdfdu22zZmB42G8yU=dqQ@mail.gmail.com>
In-Reply-To: <CAHbf0-EzHGuQ720V1g84U8Ys8HS+Lpdfdu22zZmB42G8yU=dqQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9f169c-06a3-49ab-11a8-08df0782d156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|10070799003|366016|5023799004|4143699003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oCfPA5gx/WJvEci7HO0qZuIoyo0T+ljDXdYKf5GlswunqeXcdkuyArdTUWVuvndKO3rPNKTawHXx5NyJ09r8iniZoVGyz5cR4IIHZ76yvmy0jMRI3x8pgE1wFVNYCJcoch/zEqtH8S/awlx2wQAyl0+spYxdWCFC3Ezm8BROWoWZvAWOY/hFl6R/Pp/KFnGrbq0J+pVRQvIKL9y9hzuYETxMNSuLu2Pq2FDkOLuCI1EtWOR8lnLZL8blEghpG+6ZLsgdGnwoIedvjlKfL9mVeLvItx9NcVsUx1gEmnGJ0Yz5JKa3lS8tUZ7Ej3jkPAsNAS3Y4iCjMdjX6u/xHOSl6LGi9mYzOiG5vTsBWTBR071tBiTdn0OlWHISDku9wSxAJUtop+b9UjVyGdAOTPFQuma7iH2PfyFD6hGp4Vm2ycnRfDrhGauOOi0uYukJ0IMqu/xPov6wfucAdX23xatksoB1Zc9uYbdBHUxejwmBoF3S1OI+OoSE8QwSjaTPRRkbc0oSktCwGKOkMfUIpZzmi3AtlamQMlb/RusPGQAqyeRVLCvrpeNcWDdGin5deHprnfp0gcSKCQLfZFwjFSfGNjH6wSlndqK0Xtye7E6imK4XcD0QgW9DdVZ2MNCAfqQa2CNCXwZp2XQXOEbJX2k12MDD8uBDjXYrkECDe4YOFWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(10070799003)(366016)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkhucldYc285YTZuWmpOaGo3c1hNUUVoSitVMmdCKzNBdk5xOG1Fa0NJM0JD?=
 =?utf-8?B?NExJdmFlb1pKTnFYZlgrSnJQdTJUOVhKMVVKUUZ6bHQvNk9mUk1aVU4yMWV0?=
 =?utf-8?B?Q01UcEh0NTM4dk5WeFNra21mNzZLdmVRNWJ1ZjlWKzUvSktnVDVXRXJLZkF4?=
 =?utf-8?B?QzhNVCtOZVo0WEZ4WklXSFQ1d2pxQkk4NlFxWUkyOURCdkJ4QWdBbEVnY0dq?=
 =?utf-8?B?dXFrUFowK2RJdjM2c2FyVGZlZ3J3ZnBoSXFQT2ZlcmtQRFJDZTdhMkI3Y1Ez?=
 =?utf-8?B?R1ZQdnlSNmVyWTNHdFlvRlB6cXl5ZUVHRWtEd3d3RUl5K2ZpRlV4QnFXQkZV?=
 =?utf-8?B?WjZmNWtPY2FZa2ZUbGpYQkJ4eFowNkRRZnl5QzBlSUxEaDN4OGNkMkNKK2hp?=
 =?utf-8?B?MmR1R2pQZHNSaVhIYldsZnlOa2RvZFRkRTNuQlpLZVNKRVBBalNLcEZnbEpw?=
 =?utf-8?B?eFhnRFJHaktxOGpJa1RlRm9nb0gxbFVpbzZpOXk2WTl1RjYwWnpTWXBrZEFY?=
 =?utf-8?B?SlpodjhTdUFobTVsSEhQTmZ6Sk10NGJmSFR6UUY5QTRIOVhaSFBqRUd0aGth?=
 =?utf-8?B?ZnZkVmtWOUxUTzVSS0xqTGY4YWNmOVQxSkhpTjhRVURqRGw5UWhWaWNHR2RQ?=
 =?utf-8?B?MEJISkhvOXh6cFhpSzdUYzNPS0pOWnU2ckc3WHZia0lGNnZ2aDBjQUxRN2U1?=
 =?utf-8?B?UXNFa2tQeitpcmxnMmJ5SFV6YTV2SkxaN0svRXdETW1rbWcvdEZtMFIxRzJR?=
 =?utf-8?B?dmVkY2E2UzhDZXI0bDBJbWpLSmV4Ny9SNStyWkRNNVZ3K1lSa05jWFVqZFQ4?=
 =?utf-8?B?Q3p5YllLVnMwQ1I2NHNyVWNDRXkva3l4ZGYwUTczbVhCZWw4NlBNYXBHb0Vo?=
 =?utf-8?B?RkFtSzZvZ2pZb1hJclNvUXhuSWxhMC9rcStHWDdWSlJlQTByOXpKSk1OMFZh?=
 =?utf-8?B?L3Qxdmpma3MzNEF4RWUzZGRJdk9WSEdCb0dDN05PK1B6VjhEbXlBc09HeWIy?=
 =?utf-8?B?bTdOZFJTOHFCMytuRVhmMFVpdnQyOGRCaGFRcjFyUjdTdU0ycVcxdnFBZVhk?=
 =?utf-8?B?aE5ESXgvd3pKdllyVjUzQko5d0FUN3l6N0hVTlk4MnlCWGs1QnlmdmpkT0wv?=
 =?utf-8?B?UXd4L01sWmZBaXpRdVVrcFBKbTBPR2YrRVY5YUF0Q0ZoWkNaaDUvSndSa0dG?=
 =?utf-8?B?djB0azFWNVovVEVvZVNCREhOeXlUNlhvdnJoR0g0eUxqRzFydFREd244OGZX?=
 =?utf-8?B?cmNrL2hEek1wbjUvaDNiSnZmUnQ0VHV6NFdSYnhtempKU1FHTHZoL0tQM2hG?=
 =?utf-8?B?MVUvOWVvWXh0V3NEK3ZXWnFwSEVXSTFjQkNWU3VScjNGSmdndUlCSDR1U1BG?=
 =?utf-8?B?UnpLWkVnVmljUzBqRERoUzFML01IaE9EL0hxVTdNYkV0MVlXUGtqVXg0SnlM?=
 =?utf-8?B?KzRsRGQwV1ZFNHpJamFmU3AyaTRnbld4dEpPeTFaMGRVUk11TndYVUY2Wkxs?=
 =?utf-8?B?THRNRjc3STUzMG54YTBUYlhzYktjY0svMjdoS3hWNWhZMWdvbkZETFZJanhC?=
 =?utf-8?B?SnVQcG1IRVh2OUlLcWUrbnV3NFh4Z3ZPeGtEU2ZqUlN5MVhmUTRra0ZkaDRn?=
 =?utf-8?B?RytHL3ZEOEpCZFdIK0UxTm1GT0N1aGZTc2xMdC9IRWVOZkNVTEhxTjhuNlJv?=
 =?utf-8?B?VCtrLy9mT0tvem9YQWw5UG1oeElwbWh4QTliTlppVTFEQXAraC95bTQ3V1Nw?=
 =?utf-8?B?anlkTzFHOG1uNytmQTZsOHA1eXhmb0VQTklFN3Q1Y1RueDdRdHFnMkNWOWoy?=
 =?utf-8?B?bWRobzFZNEVLeUZURjBPNVdtQjFSR2hHTkJRbmtYenFPeVlIKys4cUh3OTBl?=
 =?utf-8?B?NnJYeDc3Y3Y2ZjZITlZ0TlRxTHhtTTMrcDZJR045cTBYZ1Z5Q2oya1RnSVhU?=
 =?utf-8?B?SjdXeENUNG9WdmVSOG1OVlBoQzdQYXliZXdvZG1CQ1d4M2Y3bSt2Nzlob0dx?=
 =?utf-8?B?Q3I4SDRjNSszT1hhTFhBSWE2cFV2MWlMSHZBdDFlRVp1bXVPMFJwRmVkdmZq?=
 =?utf-8?B?NTBTZThFbGxZQUIrTEp0eXkxWFRDNzdkNXZ2bWoxeUlGd2oweTl0ZEhmYmJF?=
 =?utf-8?B?UEZtaVZDZzh0ZWlNRUdYT1lYZTlSS3VxVG4wRHR4NUltbjZpUlF3ckN5RHNW?=
 =?utf-8?B?U2NIb0RYZHA0blIzaEM0QVFMeUdNcFh2ODRJbTl5ZExvWXFlb2VLTkFIMGJp?=
 =?utf-8?B?TDRsMjU5RkxISlg3ZWRCWjJoNmxyTENPYytxVTNsVVRGNXE2RGh1SzFIWE5G?=
 =?utf-8?B?a3RWYnl3SFNnOGZ3OHQ5MTIwM0tEOEFYd0hLcGtCUzNQSmNnQ1lHZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9f169c-06a3-49ab-11a8-08df0782d156
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:10:54.9946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzJh9oan4AfBgjYuVOAoMcEVR/MGH6PBnnSEqxSAhabCBe4qEhe3iUACAvbKaUFP0V+m1R+6t1RPAmQqNYThWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9145

On Mon Aug 31, 2026 at 6:04 PM BST, Mike Lothian wrote:
> On Wed, 26 Aug 2026, Danilo Krummrich wrote:
>> > + /// Asks the driver core to unbind whatever driver is currently boun=
d to this interface.
>>
>> What is this needed for? Where do you use it?
>
> Nothing in this posting uses it. It's a leftover from something I
> removed, and I'm not sure it should have stayed removed.
>
> It backed a write-only sysfs file, /sys/devices/vino/remove_all, which
> walked the driver's list of held interfaces and called
> device_release_driver() on each. evdi has had the same file since 2015
> as /sys/devices/evdi/remove_all, so it's a name people with DisplayLink
> hardware already know.
>
> I added it because unloading the module used to be unsafe. disconnect()
> could deadlock against usb_hub_wq, DRM references were held past unbind
> so every replug leaked a card minor, and one unload took the machine
> down. Having one write that unbound everything from process context,
> with each disconnect running somewhere I could watch it, made those a
> lot easier to find.
>
> They're all fixed now, modprobe -r is reliable, and the sysfs file got
> cut from the series along with the rest of the development scaffolding.
> The binding method survived the cut without its caller.
>
> I'll drop it for v4 either way. The bit I'd like your opinion on is
> whether it should come back later with the user attached. Against:
> /sys/bus/usb/drivers/vino/unbind already does this, and all remove_all
> saves you is knowing which interfaces the driver kept. For: a dock is
> the kind of device where someone wants to hand the hardware back without
> knowing that, and evdi has shipped the file for ten years.

EVDI is not an upstream driver, so the fact that it supports something isn'=
t
really a justification of adding a new API interface that is already covere=
d by
sysfs unbind.

Best,
Gary
