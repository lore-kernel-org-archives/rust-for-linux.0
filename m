Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021129.outbound.protection.outlook.com [52.101.95.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05DF41D20F
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814204; cv=fail; b=GVpW1LR6QOwU+ehHiDMl3u1W3rWiyX79hDHr1lzDiYSu7sgAQN81EIeiksoigQhDqvhpb5xAh5wbRoYH1f6RWmi/jqMhR9XaCwumZz/jKNsAvZ5rq9gfUhxmZYmjKBMOg3s2kv25PNROq+zzSuGbdyVaIcBxvnh4W/Xt6iGnTPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814204; c=relaxed/simple;
	bh=FgHcea2IJBCGNayhgDefP81Lv1/WDaWppIqxDyIllLU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=r4mb58Qo3dKi80ajUn+fP2pN5bxzt0Dm7kVX8wWraGn0iDrZXnEeEwKNwbJR1ajRZiXgejE6o/aQyrO2GztBzqVN2B/8Sl+5AV98wd+R79PyBNP4vgi1Zdp+PkM4K8S8gojSY7z8UWbewXMZ0Sf7IFwWpNQvDAjTnHUPypaamos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=tPcQyrG8; arc=fail smtp.client-ip=52.101.95.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="tPcQyrG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txmoTwU72vE7rEGIOyTh8CZqGBXogoImw0tFHLN4W0YU/sPBBdvCzUdCKkf3YApVsPkJjw3DIqMZElzf8DQfXtq4zp+ujsCXiDH/O5us77n0C5IITYqPtcZKdoOsKF3soV4oRC/NbVcVjh7OworSPjQq5DNHfxUPY/jMRKirjcqSCPe+pjZJQGxkNyShQyypeWWfJocLNv2DZEs9HQ4usprROCU3xB2NWgp7j0TwQX0yhZJqMo10oRJ0hL9p33aPRycbyTJMRYWtFOkoXbPitMYIp/VZn/NYauPmz5pO65p8Vgr3jJipu7e55ljdovcmIaH4OJZHJUz5F+jYDvUksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1erpV07bTxc67xVgkPuCBWJhjinMpEBvDStTT4JvyFo=;
 b=SHJCj+jn+1mJlyUvPMh46ZO5/4VhBktKGY+486MR+9WM8i+Wxhl5MjOliLcr0KI2DsdZIBGlb7rOe+cSF7WjiQl/1qjOTtxp0zye/my9EKJOlWyga/m7gzU2jxaHa9AwkZQ0l5EZ+wlFHsyDdyTA6VlODdC6dGyDS2xqQBZKGhrMZ/8t4HIUaFXJDOdROHma7Krp/TaBAjqPUy40Ea331PIDHcaK7TY9C9D+dpw1CFq+pgUyN9ZRhstZn5+Igx1fNoyIQtuJOT61Cc5rC25WWlgEvS0O1zQ9P0EaEy1X0ud/CGuEqnCpCww9qspGO4VRQFH6vIovKsUfx1WTtBagmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1erpV07bTxc67xVgkPuCBWJhjinMpEBvDStTT4JvyFo=;
 b=tPcQyrG88LI+fvu8o7S41mGFbDF8bjI7EIH5oD5wk60AmWLpBGkf9UnI67z5D9yvVlPSChy5fptweaTMPmmouy6HAjE/ljvfajhoV11T8+6kZhqDNJ4xKOBlZjut02IA3oIeO9kYIMWp9ye704xLEsElNBaOzOk6fpsMMeccv3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8611.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 13:43:19 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 13:43:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 14:43:18 +0100
Message-Id: <DK5ZTVFQSA3I.1KOTU1RNJMWS6@garyguo.net>
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
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260722214951.72941-1-tomo@flapping.org>
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d56fa6-8ddd-4ae8-9b7a-08dee8c05afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ee71A5b76NB3GfzIqUiLUtdYoRozIqr7WW2JOQfdutOrAUK3NdksX8TM1jv6m2sb2a+7Co7CXkJzJUX8w6E+4jC2xgEr/qQFNxU60GtlWMjY2+etoKn+pl67j+I87DuAukgUIWKVJjY76pfssrFT4I+t23p83Eln9vfERvYGIdPr5LiXhgKHTxZdmHGaboIJJiL4RdvT8kYe0yjMVC3g2oQCQzYrLKwm8Z28oX25ncNu64txj8lipXnznRxjyTRKa3+RyjBqwQnrSPmTx/X6QdRN6rzV/mC1rwk9isW23yq2WHO8D247WEZodB5w2HthfAoA+7bs5rahDi1Tc69LtuRMUCH1TBgp9oDanJk5cYU1vRpagFmYdjIpXTMBocLTe1fas/0c9jDTUDCx78l53+8lS4dJnviaXAa+96q0/2Fdk7baQa/lbKyOxTISFQSIcMTcbofVBfX/1aBGzvsJHt2B/U6DxYJzxQ+/gbyNYmIgRCNxujxJ0Kv5GNcIbldNVYC5GSC7jpNQPkk6pkjYsTuz2TWP9k0cHQ7Ba4eBTHGJs0KHuNhEywlyVeKFhchP6bxnER0Eb7o7OkSlkJqca6LmwxM4XRkwMMSqichbx8QAYTUTH2MrRPAScAgMH1OQxBv3sGLwE0Eyv5inHhhKC3KG2msoDAMcsB2+Qud7rPTrZdrk7G5TX4dmfBK8/GapVks/bVq5S8mv5wHTmZ1Icw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVFpQ3k1UFRPejd2S3ZWSCtJeWpEbTc0Y1F0R3NtMmpKczR4RUlQbmJsT3kv?=
 =?utf-8?B?RHhUaG5UcmoyRjk0V3liRWt4cEhKWlRxbmZvdTBsbDJhK0hpV2VVL092S3dZ?=
 =?utf-8?B?TGdtZ3FRRGlMQjJjaUJnRDgrN2ttWjVmQXp2Q3ZSZi9JcURBU3pSZ2liTU5h?=
 =?utf-8?B?UHlwcmE3a1dEeExvM0xUMUJiNnovWEprbWtxRkJidzZ2RjVJZFVIYURkM0dP?=
 =?utf-8?B?VzZBWlZNVXBGT1NVYnk2eGplMitWbmZqeHRlNTVFMTJsbGp2ZWt2UUh1bjc1?=
 =?utf-8?B?bGEyY3NlaXZqRU1ZOEs5UU5LblFzaXhxY3BtZTVvTERYZVM0NFFvckFoRUNE?=
 =?utf-8?B?SlVoSHVCVlprbkhwak5FS05iMXhnOUM5ZVZwWG5IVi96L002b2VjT3dvcWFs?=
 =?utf-8?B?cGhRbG9qS2s0VFEvcWhBbThUQk92Vmc0T1Q3YSs4cXlCR3VIKzVUQ09ZMDJp?=
 =?utf-8?B?UmFsVzBzRkZMVlZ4QUpFLzRhckgrTDRmdSt2aDB6Q2MvM3FlWFZYYVVIUzFE?=
 =?utf-8?B?MlpiVWVRTzNxYXAySXpuZWZjUFpQbzF2U0Fpc3V1YnNYdDROdjQwbElBcDQr?=
 =?utf-8?B?OCt3bjVmeU1ldHdBMUdaQ0NqN3BNNGF3bFNZZ3F3OVFiQVE4eXNuQkFLZ0lV?=
 =?utf-8?B?aDlIaXdJZHNXSFFwVUl2bDBtYklSNm95Vnd3Q0E3TmQyTktmMUtPc1NSQ1VK?=
 =?utf-8?B?YzRYc0o3WWtwSncxWGJ5L1UyRCtSekJKQ2M5dC9lZ2c5RDZKL0lxUnQ2YXNj?=
 =?utf-8?B?V0E2cmlCZXpzL3NkYkZidDFqVzhHcDdMRWdPWnJ1NWVTUzBBakt5clM4Yzh6?=
 =?utf-8?B?NlNuWmN5eE5MZUM2anNYYXp1endDN1lXZitzOUEweUpwV0lERUdRL05GcXdZ?=
 =?utf-8?B?bFVxVHp5R2dFUE5PYnFMVGdhZnVTUDFFSkZCZDZXa3ZKVU5zQnRKSlc2N2RW?=
 =?utf-8?B?ZkhaNHk0WWdWaEUyWllENWVHNG1RZ1R1UkQ5WUc1SEhTZ1dWcm1oRTNPT3Zh?=
 =?utf-8?B?TmR6Wm9sVXdXNmJONGpXK1BQSEgvUDlKdk1aSzNpRnZSeEJKMU5mVEhENWJi?=
 =?utf-8?B?aWQ5ZjJtYWkyTXJoRDlnNzZjcGJ2Mmp1WnMwMkx0NlVBc0lJRk1JRHE4a3dF?=
 =?utf-8?B?Ti81WHVwNUpNQURqNFFONm93UFhPeDFVRVFMNXc0RTk0OUxvdUtYbG81clFi?=
 =?utf-8?B?MGw5MWJvcS9IMHFnc2lmQWdxc1RSWWJDMHBNT09hajExSTY0ZXBlMXk0YTlW?=
 =?utf-8?B?VFhHMm5pMkFuNWU4MEZ6ZmRHRk94VHpLU3pmcmNZa2Z3bmhzdDU4YythT2sx?=
 =?utf-8?B?UzVHYksrNSs2ZWVQVEQ4UmlYZDZYcUZZZkpNZ0I4VUVLTmJ4WkdjQTNKVmFH?=
 =?utf-8?B?QTg4UWcwdXZvMU5VSUY4Q3NqZEx5VENYc2c4R3A3TlR0anZrM3pwcUhyNkpF?=
 =?utf-8?B?SlJkWUF1aGQ5UEluRnMzZHFHbFp4VFJJR1g0V3hlUEdiUjltd0ZtWlBtODJv?=
 =?utf-8?B?OGYreDlWaXJqVUQ3WXBwNHRtbVE0d1FjMjdjcC9lSWY2RXVhZjR0bXhLcCtE?=
 =?utf-8?B?Z1dtMWVOQ2NqazdrdG1oQmFZeHJraVI5M01SNzI2Q3JJcmczTHEvNnNva0FT?=
 =?utf-8?B?VWhKYnEzcFBIRHI4Zm5na2tqazZrZUU1V2VlT3JIbzBJWHpUQVF1Y2lVaUxw?=
 =?utf-8?B?OHZLOXV3SW5Yd1Y3UzZOUGZiTXNNYlhOMitNVEhpckpEVmRaalNOZXdXZXIr?=
 =?utf-8?B?eElUWWFCQ055NnMrZTBsQXlXS2dyL0VDQllaUDJhQWo5S0Y3SGpGa1AxOURY?=
 =?utf-8?B?Qm5ERG1WeU5wdjE5MkVyMldOeEY3Wnp0c0ViaG1qNjBlcTJmYm9jOE83dTNT?=
 =?utf-8?B?RitCei9JN3Z4bkd5TzdRVWc4UHExMk5vU2J0Rk05cGNXVVExUFlmZnBEcXVt?=
 =?utf-8?B?TkpoejdnbWVGVnEwN1JGdDVWRm1Yc1ZUcnFicWlQcS96czBxWmhCRFhidmRz?=
 =?utf-8?B?cm9PZGRDNVR1eHdPUGVtWGZHeFJlZ0FpYTV1YWxwMHVJNGw0a1FCcG50Q0Nz?=
 =?utf-8?B?ZTNET1VjRWRaV2lZL0F5K3FSbXJCdnVjaGtBbUtLUXhzSVFSbE1JbkVVbmZ5?=
 =?utf-8?B?bWRTZWpZY0JsOVFCTDE0ak43cWR3OEVHMCt4TlY2ekxzUnhCVksrditUUHBy?=
 =?utf-8?B?amI4M1Q0ZFgrL1VZY016VVFpRTAvdktOZ3hjWVQwWFFRY2MzVDlBczZrTlNa?=
 =?utf-8?B?MWllV2NBaVlpYktwOUUwSVFqK2dJa04wV0RQTU1LM1FQQi9RVXA5L1IzUytW?=
 =?utf-8?B?TlBRbHR1YlVXRU0yejlxMmQ4OWxQQWlEeDJqSkJiUnAvdlhsMTUwdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d56fa6-8ddd-4ae8-9b7a-08dee8c05afd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 13:43:19.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnfKL3M3oeTgchcKZ/QJTgPiGWW7oVAXJR3dksQRFjCERUrADSo2ZtsPvJtGfGYnM7kZaFYBao4lG03RAqO/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8611

On Wed Jul 22, 2026 at 10:49 PM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
> a raw jiffies count (a plain c_ulong alias with no type
> safety). Callers have to know on their own that the value meant
> jiffies and convert to/from it themselves, which is easy to get wrong
> (e.g. passing a millisecond value where a jiffies value is expected).
>
> Both APIs just take a span of time so, they can use the Delta type
> instead.
>
> This series makes Delta generic over its time unit with Nsec and Jiffy
> types, switches CondVar and Queue to use Delta instead of raw jiffies
> (updating binder's ioctl_freeze(), the only caller of
> wait_interruptible_timeout()), and then removes the now-unused Jiffies
> and Msecs type aliases.
>
> ---
> v4:
> - Make Delta generic over its time unit with Nsec and Jiffy types
> v3: https://lore.kernel.org/rust-for-linux/20260717042247.3634961-1-tomo@=
flapping.org/
> - Add new Jiffies type and convert the APIs to take impl Into<Jiffies>
> v2: https://lore.kernel.org/rust-for-linux/20260712235246.3069713-1-tomo@=
flapping.org/
> - Fix potential overflow in from_jiffies()
> - Fix inflating bug in as_jiffies_ceil()
> - Add a patch to convert enqueue_delayed()
> - Add a patch to remove Jiffies/Msecs aliases
> v1: https://lore.kernel.org/rust-for-linux/20260704132558.2253275-1-tomo@=
aliasing.net/
>
> ---
> FUJITA Tomonori (7):
>   rust: time: make Delta generic over its time unit
>   rust: time: add jiffies time unit for Delta
>   rust: time: add Delta::as_millis_ceil()
>   rust: time: add Delta::to_jiffies() for timeout conversion
>   rust: workqueue: take a Delta<Jiffy> for the enqueue delay
>   rust: sync: condvar: use Delta<Jiffy> for timeout and result
>   rust: time: remove unused Jiffies/Msecs helpers

Looks good to me apart from a small nit, which doesn't need to be changed
unless you're sending a new version for other reason.

Reviewed-by: Gary Guo <gary@garyguo.net>

>
>  drivers/android/binder/process.rs |   6 +-
>  rust/kernel/sync/condvar.rs       |  29 ++++--
>  rust/kernel/time.rs               | 156 ++++++++++++++++++++++--------
>  rust/kernel/workqueue.rs          |  12 ++-
>  4 files changed, 150 insertions(+), 53 deletions(-)
>
>
> base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a


