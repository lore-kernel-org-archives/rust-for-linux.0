Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022119.outbound.protection.outlook.com [52.101.96.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A241D235
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814130; cv=fail; b=bHlMor12/kkBE8ZU6ju8bm4f/AbIuqbSFKMKSZ994iEFTWxadXzREXvVGRFN+2d/oqNF8nTF7kPhKt1AEn5PP7HVUObGWfcZynsX7424kdFuPSGFGDeAURDGCdwEQ2f3JWkWluzqexE56dLUhwrpmGmAqpc5wOB4X0pIUNdaY/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814130; c=relaxed/simple;
	bh=y+7bsmtrl5o2Xe15X1Jl131RaUSQcJ+vzBDCgrp84s8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=hX96iYyE3Bzvewx1OTX6kmYZ2rTr3DJMpBLDlDEL/ds0YLoYkLkUJ2v89fZjP1bZ8iuJK3LZYCoTihcoz1u+ZCpnXBuJVHKOjABFLEC35+b2M3eS4qoNqAW+Mv1kuoXLamcgchmrHRtp0utscB9pRJDQhCRa3OjjGYgwvDOK9AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=g0JrMdB0; arc=fail smtp.client-ip=52.101.96.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="g0JrMdB0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX7gXy+XKSJL2Ka8efr/wwymkrSOz0jKI+troQLI2m4Z6PR0UDNIX/zvj2kqqGWxR8eQ7r+bEYI3YYA9OTIYcTFqsSdkf3uBAET8zwoH1CEfSc/gSJ4ebGFQM0k+cDFB8gyVZo81mYJ+zBXf86aZ2P+jQv7HSefJGwnQiSGg1wtqD5girVnNd+uWlz67pY9wM1k5oPWVtvUDa7Z1hgo9EjQcvr8bRDms9Tek/AOOgmMIr6vdhApjSQuZwSaqlS+z1baxSGmcv84XRullhw7xCyx8/SBRbq8bMitE6POAgeTpSuohwuzp5B34CM1fPwQ6DTs98TpQB6BMR2p9pqYHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkjBxSZYMmErQHWFH0RJoqnfI53MuASngWk25GJMjIg=;
 b=Smb8KCzDqUWXADxCreJ/c0ajdLGfZLp/KRdNd+qiklCt3WlTofbNH7C2UWyPMdxZR/BEAAM7lu8V7fG1H1Fjtnt/97knRE2kxk72jdrllegpKgEG6DBs/1sIFA14/yztUmmk5NbeoqZ1i4gGyB/FNrhuYumV7PFMAjF1YwXiK9yCDZU/bWrbW86Kgkdaauhe89xbgE7K6B4uVlYdY5gVl7ubxTtDcMiFnaCBUwsJBu+p8W36wGwDt7XbpyW6b843WYpGscwRWv9zK5lBoiWLM6OIzMvXIVvUnoxOKlojwDJLlPAECAm8Zm/AOFxy0zGDoorOFaZxEOGEnPMZPRfU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkjBxSZYMmErQHWFH0RJoqnfI53MuASngWk25GJMjIg=;
 b=g0JrMdB0WD6q7l9WthA4pkj+qYuDDELWnelxJFX0JMojsZp0DxshSQE+qH4LzbISKQ8R6cfvrjtHCRdAr02YbaFXhbIaiOHQE/3WNAl9PNS20eGzKQg+eAfIr5fz2OQHnPjeSDbq82SBfP+kvnVHFgR1WrqGzAK75EB3HEwcZrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3446.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 13:42:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 13:42:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 14:42:04 +0100
Message-Id: <DK5ZSXBBP4V6.1WBI66LQWND56@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 6/7] rust: sync: condvar: use Delta<Jiffy> for
 timeout and result
X-Mailer: aerc 0.21.0
References: <20260722214951.72941-1-tomo@flapping.org>
 <20260722214951.72941-7-tomo@flapping.org>
In-Reply-To: <20260722214951.72941-7-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3446:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cada27a-846f-44d5-3037-08dee8c02edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|10067099003|56012099006|4143699003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	/zlaoQgv2Z0vuvJSpPPnfTCjZujDm6u1uTjzDsBiq4FbbLkncgeaBF+td061wzlbsNCkKzlyLT1A2xozAWosW4QywAEuEMr1HyRKn9diKdxJBSJlGUVeo7E+6ISGq7KrKSeV1fZCTKu1UrUAV0kHjMHjPUZ2KlsfmCmdLeJbFVOvXKn161pf2mNp5BvRWP1UnahodSM5FFoFTX0swpHJzrSdjpKvSpa80RX8KFj3y2krndTNueUfs4a1WztbJ+D5dxUXu7SeMZH2ddW4A6+wLkUB5XXXG67U2j+s6NgOFjOxQEamrlUdqpl0hCIufE59lXaR0toUxmslk9jara2AJrklwmNCbMhZAvpcpOyUxFDm8MKtduQ/M/lbWL3mpMFWsExojmlj0T8K6h9070sJRW9oqtq4v1ziPXxd0Q8t+Aay/uix7qC2UgusrlOodKH6SZJk1uD3FAuFg4rqeZfZVeDpr1gb6hFtxu4LfFH8KAJNUoc6rBsrSdhirb6omzvZTr7EZw6KScVfS5xYKUAa4hEYL1MclTg9QYRsbt0U6QASjL+zSddmixovAXZAtdXj60pRjSCTsYm0eE3xS3Fba890K+DEpP+stTOQmQfT4Bb7FBogh1xGDcBB1Y82y53sUpYoq+M2V1l55ga8IX8vOwdHcx2dXDVugF8vMZVUBejK8f1eltseTAIcAJs25HJTuVSTJGpdTKbns//CyXQBqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlV5bzFxdThVNTNjYXl5clpYdmtiM0g5c1VaVjBLK20zemlHeDdBZTNkUGFz?=
 =?utf-8?B?QmZ6TmdiczhmMUxRbklYcGJqRjBsY0c3NjFOUVFGd3Z2bHprUEwxd3BoTHE3?=
 =?utf-8?B?eXRTVG50UHBiOTVrTnFsNnVZVzZrYUc2ekJ1T0h2M2k0NUtFeGEwNGQwajJZ?=
 =?utf-8?B?dFFPQmwrQ3FtVkcrU0xVdWhjWlhDQzFTQS9SSFJHS0kySTY5K3UwNEpDMTlQ?=
 =?utf-8?B?ZXUwTHJJbEMvc0pzekN5RlRLV3VDcW9iM1g4RmFmZERWYTRXM1VhTWN3NjQ1?=
 =?utf-8?B?OHZhWTFVaWoxc1N2M1NJcVpGVFpyZ2p2T0k4NmpaN081YmFGTVNZVjBsMnB0?=
 =?utf-8?B?bnUvOXlDS3FrOXJ1Tk5wYlhWUWdtQldQZFZFUUVQbDZrSWxkSGRtdzlWUzdV?=
 =?utf-8?B?VlZuTWtCM0VkWHZlQTNPSG5HL1pJcVRid0FnKzZYQjBicXNqMXN4RlFxUko4?=
 =?utf-8?B?TExGMjFjWFRlRmxNOUl3Tkg2cUN4OElTTTk5c2txdU5lYm9QYVJHRTJSUFFr?=
 =?utf-8?B?NGxDVWdvV25zc2NCb0ZWV1dqUUFzSVd3NWM4TStXTi83WmJ0WUdxd1oxbUVE?=
 =?utf-8?B?MXRCWUFtT1IxVnZRTnFVTVhYeXUxSlRQNHJML2I0NUhsTndzUjNvdURjaDdM?=
 =?utf-8?B?RHhPY3BUZSsxVGI0cEZOZXQvWk5CMklxd0g2UWFjL05ueG54b0F4WVluTG1I?=
 =?utf-8?B?RHRzREdNQTBEODVGZldMMFRlZUMxM3FiREJzZjVIOXRZVTJDOTdNaWVaNGE4?=
 =?utf-8?B?WHljcFlLcllhUlo0bVFqMG9Qalo1RW50RSswY1N2R0doeCtJRnZGM2xRYzJa?=
 =?utf-8?B?cmdxT3R0allCYjlvSFFxcmFQMy9oZlRtYnRTQXg4VUdXTUovbFNOeXg2TEVX?=
 =?utf-8?B?L3oyWXpHT3RaTEh1enhwdlZqQSs3L1EwYzFES0ozVVRxc1FDZmtDM2RYZm5r?=
 =?utf-8?B?RFQxcFRMUDZ4VXB5UitBUlZmSTIyMGoyT0VvTldYTmpWZFo0M1llVHdYeCs4?=
 =?utf-8?B?bGZxY3FHbGl0blYwSkd2akgzdjdSWU13NXJYVWEwekZBVTdRM05RL3ltOWtL?=
 =?utf-8?B?MnhMVXVtQ1YvRFJ2TEFaU1NvdXBQMHhvUW9XdTJpMnVBYjhYeEdLZ3BsM1hC?=
 =?utf-8?B?VlFaTUt5aFdlR2dnVkZnUEdhWHhUWUY3MGpvV0lHV0JxcHc5OWo5RTJIbXZi?=
 =?utf-8?B?dUJRaktNU01GcXhMUCtmOEp6c21DeW1pRGl6aHE0aCtUZFhiSE9TWUxSWWJE?=
 =?utf-8?B?NnIyZ2NEZXJtek1jNHNTVndhOE53UmtYYlczOHk0YVc3d0lpT29VWldwelBi?=
 =?utf-8?B?SHdoWm4vcUJuaUNuai9wWDZCYzZVbXFzaUJzU0pDbjM0VmQwRDJYSVNvOWtp?=
 =?utf-8?B?cnhGRTd1UHpFaVB3d212QWYveHBXcmZEU1g4bGZ5MTNTRDRUM0c2MEpLY1NM?=
 =?utf-8?B?bitBVytJcGVsQXJpR29PVEpNNElKUVNwbS9jeXRTU0dXNW1obUVuek10aUJt?=
 =?utf-8?B?Z3JaVy9MeFE0eDJad1pzUnZtM3FTLzI5a3NGQnEwMjl4OTJZZ1FmZzVGRDRE?=
 =?utf-8?B?S3BOSk9iYmQ3RTBsV25NYTFpN0wza3FTVHRTcEczOEIxNWhYaEV6dURPVUU4?=
 =?utf-8?B?cXlUR2pnM044MmdpOVRUTEZKRWdJcVJHeElxZGx4c1BVZmpoMkN0ckJvd2Jp?=
 =?utf-8?B?bUsxeENkVm5OU1pMYTZGYTJrNzNRQkdERHM4RjcxV0o3L1FFc0NTRWZCSDRN?=
 =?utf-8?B?Qm5kZ3c3K01iWElaRVRaOEM1UWZJTExrVlVhZE5iUU5wSkdubEtiQ1UwMm83?=
 =?utf-8?B?S3Y4MzA3ejZQQW0rZXd2eHArb25DeWZVSVpYTVAzbFpzbzJRSElrYSt0bDFs?=
 =?utf-8?B?eWVCblJJSmhpWFdyd2d0SXllNmcxckJVcm1IcksyVlNQYjVHWkZZRng1NWVx?=
 =?utf-8?B?RjgxTGZCdndCbFRwTFF2NGdVUklySXhqYTh0UlpSTU1CRzdhelJtSk5qNGRs?=
 =?utf-8?B?NFJFZS85ckJCVE5SSkRBN09iU1ExQkltdTkxa1NQbkRYOENPK3FLY2hZKzNh?=
 =?utf-8?B?T3U3a2htRzdESkFwZGxSZDloaHh2UHJieEVtTGVKaGxqNWdlL20xRTdYU3JB?=
 =?utf-8?B?VHVYY0t4ZDVuZVprYlAxMG9PYmZvNXZTUHhIQmxoNVZsbWhnbUxZKzJCbDVv?=
 =?utf-8?B?YlFYUnlLcnFkbm9GaWJJblprMlp3b2IvWDFUNFBUcVZ2R1BvMUZsWVlQeGdq?=
 =?utf-8?B?TFZHb1ArTEdGMWJOZkpHZEM2R1pHalJHd0VVZW54cUF2L2xtVWw4TnhyQ1RM?=
 =?utf-8?B?Tk84ODdQc2pKSEQ3cFE2OTZxOUFHZ2tIYW9wSTV2d3J4bkJWbjA0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cada27a-846f-44d5-3037-08dee8c02edd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 13:42:05.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inkjy/T8rCQNRQ82K28QiJiDOWTmadn2dSVIHWiXto/qYsahAtF2qYe10Cjx0GdDwcRhFCpNADVxTqufgtJNUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3446

On Wed Jul 22, 2026 at 10:49 PM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> wait_interruptible_timeout() takes the timeout as a raw Jiffies and
> reports the remaining time as raw Jiffies in CondVarTimeoutResult. That
> is the C representation rather than a kernel time type, so it neither
> carries the unit in its type nor composes with the Delta spans used
> elsewhere, and it pushes the unsigned-to-signed conversion onto callers.
>
> Switch the parameter and the result fields to Delta<Jiffy>. So a delay
> is expressed in the same time vocabulary as the rest of the kernel
> crate.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/android/binder/process.rs |  6 +++---
>  rust/kernel/sync/condvar.rs       | 29 ++++++++++++++++++++---------
>  2 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index cdd1a9079726..314962b5361d 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1482,8 +1482,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFree=
zeInfo) -> Result {
>          inner.is_frozen =3D IsFrozen::InProgress;
> =20
>          if info.timeout_ms > 0 {
> -            let mut jiffies =3D kernel::time::msecs_to_jiffies(info.time=
out_ms);
> -            while jiffies > 0 {
> +            let mut jiffies =3D kernel::time::Delta::from_millis(info.ti=
meout_ms.into()).to_jiffies();

Given that `Delta` is used twice this can probably be an import.

Best,
Gary

> +            while jiffies.as_jiffies() > 0 {
>                  if inner.outstanding_txns =3D=3D 0 {
>                      break;
>                  }
> @@ -1500,7 +1500,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFree=
zeInfo) -> Result {
>                          jiffies =3D remaining;
>                      }
>                      CondVarTimeoutResult::Timeout =3D> {
> -                        jiffies =3D 0;
> +                        jiffies =3D kernel::time::Delta::from_jiffies(0)=
;
>                      }
>                  }
>              }

