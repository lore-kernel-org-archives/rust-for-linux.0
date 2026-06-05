Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020118.outbound.protection.outlook.com [52.101.195.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CB1A5B9E
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667465; cv=fail; b=k87FOlknW3JllIJIISxCK1XC0cr9jrco1yulf7u3IAyvepjiNCLWAR2eRhUy8IkbmoWuT2ww9gJuCNwDwcjJx6U4bOC2UHVqEi4b0bggGXvtsisyw0x+/O82jCVwvfXM8GFfuAaTYpHKtY3zxoAO9U2V3/hQ1ZwxWyxr7b5pIw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667465; c=relaxed/simple;
	bh=0+r03J5L/+q2RP/FATklSjLxGerRRTqzd8IMcy0EqP0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=fLPD2rx4HflkrpoKiLDDjiPSrI2T0RbzKS/if44YWkNtCk5WuowQN3VsqaMylWwZiyGaFYMeajR7wBpwWccjpkAIubLlQ0JPE3kbjxU/h1Km5akqNRaiAvByFzqEunb7BJUY3fOWEEeq+G0xO2Ys1tO3VcTSigskOzQCgCyn4lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LoS/XMnC; arc=fail smtp.client-ip=52.101.195.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LoS/XMnC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kx32mQkKCuTLiNM3mXhaHGI+gz4g5K8qjIjpoD+Q3bOscOnI86AtLKPuKaHWPTPig72DM47oorvNSjLg6jcd4HPha/FhEa4iwf0C52z4erDysNntnAkWt8qqYu9gI9aujnPThFu9eG1+G8zXR/+H7QwQNswap1l2kukLvescxuoW2Uqx2KhLB3IU16gREE6R32/Br7q7ZXWzRGxNt0Egr55YM9CNryEpDoktjUKICFyXE5WO1qtg8IVXrBkVR7VXTID/XnhxU0WpaJMJj5EuSWGaAvedl/wVckWClCQjssHcU5kRam7RxQqJIUWE2ZgszWfNyupCKN6keN32EaIPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Gr4TfVICfsO4s9Uw8CLKf6Kk82Nb1ZEjYmOhBkgEs=;
 b=ZAZKb/jG98sja/JVy7LMhUshsrXDvLZbd30ALQu8rDwMyIpjALcY654rHdoJ/5Cr2s/1YRrKB4QKf8+VbdqeW204/bTTdYOWRTj4i5ZZVmfCiQBcQmffBXrOKN9tVft0if95Y5BxpouCT0ReQP8QXZD0qLAuBiw9dAyqAzHxBAU4y/t/8m+oWvibTl6oNVDjA269SHnNIkkNqRRQyjZxp0h0d1YJ6mnDxphGpF5ytj8LFhWVSEk0JW33zU3rSUQu0DkkEpx5i9iDf2pt/FkjJst6hnbU+nNrc8T6otAQklHpb4ZIURgjRQ4vRk9ScwZaR/PkBiHY2AkpXmFi/pr8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Gr4TfVICfsO4s9Uw8CLKf6Kk82Nb1ZEjYmOhBkgEs=;
 b=LoS/XMnCySvQPpRyDNW9lgkmFz2qTYEHPTaLlIu7X2odY+lSVaOSGc54xL3CyN8uXGZEKChlJUbJndMBZ3RqtA2FoYhZW/hK/lh73nJLoGWYkdparKBttB6L0d4qllBicDXdlRfP17TMVY2XsPw13klINFhK/GhvajbA+xyHvUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6784.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 13:50:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 13:50:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 14:50:57 +0100
Message-Id: <DJ15XKSIEMIF.294EQ6XDOP10U@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Yuan Tan" <ytan089@ucr.edu>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <rust-for-linux@vger.kernel.org>
Cc: <zhiyunq@cs.ucr.edu>, <ardalan@uci.edu>, <pgovind2@uci.edu>,
 <dzueck@uci.edu>
Subject: Re: [PATCH 0/1] rust: block: mq: make GenDisk Send impl sound
X-Mailer: aerc 0.21.0
References: <cover.1780633578.git.ytan089@ucr.edu>
In-Reply-To: <cover.1780633578.git.ytan089@ucr.edu>
X-ClientProxiedBy: CPAP307CA0002.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::6)
 To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4f2b64-217d-4813-6dd9-08dec3097944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|17002099007|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zMGgYXOGFtBgm+xGSiy85NAKXGv633KaZXQDq1XF6tyO2EJN+Sbx1lOgLC4+G+i65V6adjMYocLgNHrq5cdA3fC4AUtXz4wV9ZR2HLmv5a9lIDCu3YtU0j0SKE2i3K8w30iCorxv2kL9tCs57gpcimNFjdPK7zIgz9vVkKszBVdz+S5H1GyVd+TwVO5VPi99K2kTYvzhxolW3VdAWR97oSaLqZXNOgdkw1N6RAUmcE1e3/bpcPXcCNTExy+PnW++Hu8qs+OZgZAIT0a6b3HvYwwmRgFqFB76jnqHLUxsDKLnyLx6KLdgkuMesPSFd5Up7RoJmjMEyddhigB09wsSUFVn9UyU2OmLMyvsCqkHGamfO4F5h19DBWCTXF8c8EE5UU/7XBl9EDfoPmcpxCDUTvqm6OsQGiA1Zn8A2RymtVeL4FQ71ss22eY3Y6zaCDztKgG5CxLkAN9kx1UZGDfmbVPt2lh2Y/LWpI5ATkgFyunxN0wa5BBmlMLkqlBWoKcWEZP/kkqzObe/2pBTmHny1kTAL74WoStlWky+86nZi6b3aCsCjWt0H7MWfB9a/BN5PNVY3bjZ9McQzM8IPCVtQEBnAKstoSwAYyOLBi+ImKfUDXeyvitL4epGeueACaajle3RMuYc5EW91+ZX5xRGCjB4WGSoGXtFAztzMQcnapRByQPL+8HKI8pn9MEM3tXu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(17002099007)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUQ0OVZOc3NFaERkRWx4czB2ckJ5a0F6WGRlOU9mTmVxdlRFNVpkZjFOUlpr?=
 =?utf-8?B?QVBYTUVkaksxKzUwbmFWaWQ4Z0p5RDJNeHdkbmtaU1Y1eUVUc0FRNm9QZmZm?=
 =?utf-8?B?ejNFWUE1UG1VamsyR3FvVytudmlOU2xld3BJT2NsVEVlV1V1L2R3MVkvbEhI?=
 =?utf-8?B?RGtuUVlCdWhYZlFZWGhZc1IrM2k5aGRlOHNBUlVLRkt0d1VRZDdmTkk4QzJx?=
 =?utf-8?B?bno1V1VsQlJtV0J3WVZoNzZmcW1lcStoK0pFSjRvcTlsV2J5NHFTMnFyeGIv?=
 =?utf-8?B?NWNEWEJDMFEvVnRMM1U4MlhLREpnQ0JSSjNERkIwMVhpYUlraVFqVGY2aFl5?=
 =?utf-8?B?R1oxL1U5dVdxd3ZuTE90MmNqQ0pMSk1rZExQTkVwSDEwRUhpR3AxTGRoUGVS?=
 =?utf-8?B?UU5UUVB5WENTSHE0b0R3c2Z4akY1Ni94VHJVdVNkazlVOVJ1USt4SW1RSDIz?=
 =?utf-8?B?aTU2TTlwbitFdWxjZG5zSDRkbEttQUlKNm1BV1Rac1RIdkd6RDlMaHdZZHJH?=
 =?utf-8?B?U25rMXFZUXBLaXFnUHlTQlFld0E1SkhnWjJ3c3k5SlcrdC93WVlFVkVkVzZG?=
 =?utf-8?B?QTRCYXRtblQ1RlIwZlQ1TnRwNFpDTjYrUGxZNkV0V2YwYkFBSmkwd2xsMmJN?=
 =?utf-8?B?czNUdFc2L1VXVWYrOUNjaE1WQ2lPbXRBUUllS0ZDcFdldFRkMEw4TTFaUG5h?=
 =?utf-8?B?NXZmbVZxWjgyNkFTZHV4bHJvZjZVajYwdXdDOFBwQUxZUHN5SWZSQ2JrU2U0?=
 =?utf-8?B?ZzhtNjZQMkxzNzJWK1dPNUg1cjRxTnd6U2pTNnNQbjlEbGJsSU5WR1k5eUwz?=
 =?utf-8?B?MU9tTlFmdjl3aEl4SDFaYU5PbXNTelhENEdVckNyVmd4dG5rNzJDTy80NVhj?=
 =?utf-8?B?T0RkSEJyTm4ybFc3TjBQNlpaS3JCaVdWbW9oaTVkUWR5c2s0UVJBb2RLdVB2?=
 =?utf-8?B?V2s5THNUWmVmQUFMOENzczk1ZnFxbi8ydkFEZWVrVXp3MHVlVDl2SFlFcER1?=
 =?utf-8?B?MDdsL3Jkclc2YzdsVDVXWnh1RFdBWVMzcjU0QzlySEJudmRHK0JGL1NOQ3o2?=
 =?utf-8?B?ZUdqbmNQd1creVRlMytvSlVFNDFtUTQ0T3RGeGx1SU9XQlo2MTAxT09DM24w?=
 =?utf-8?B?MXlQMlg4ckZuU3psd1ZhMEdoR0k0RExNRnJCdXVVQlluZE4xb0lvRkZUOXZp?=
 =?utf-8?B?bDFZK2pGaUwvcEV6ZUxCOVNoOVM2UFp6L28yZmE3Y2hGVE4wOEp2VXBaaExH?=
 =?utf-8?B?N1cvZ3U1RlZVMVJvTFBtb1R4emtSY3NsVFBkMnF1QnZEQ1RnYkJxdXhtYklY?=
 =?utf-8?B?WEZvSGttM01NZE5GYUt4VG1pNFFlTkM1M0JROTFLVFNLVTgySWw4SmMvOXV2?=
 =?utf-8?B?WlhWZTd4Yzg0NjVrZXBhMmtRYTl0cERId0FwS0YyN0ZmK3NlNzZxOUlQOWJt?=
 =?utf-8?B?NWN5b0xKem5EdmlZSGVJbTlqejlpZTNPWExXTUJrdjdrNFFWVWNDeFRCY2ZM?=
 =?utf-8?B?YnhpZkZIZ25MOHVnVytRbFU1SEJpT05DYVFCUGxRemMxTVJXRzQzTXpNMEZK?=
 =?utf-8?B?YTRUK1V5bWFKd3p4bmRLaVl3bzZDM2cvOHVnMVBwY3Z5KzNGVWJUUmZuY3Nl?=
 =?utf-8?B?RHVuVmxoNFkvUXpGd1o3THc3NFFvWS9HeGt6MmhrS2lSdDFyWlZJUVlQd1JP?=
 =?utf-8?B?WS9NN0J5K29FNzJ1Z3VrVjl1SWV5bHl3K24rakpHV09SUHJaaERUcUM2bmZ2?=
 =?utf-8?B?STk4UERMdkNlSG9OMUY4RjJxUFJ3S0VrYnRXWjkyUlc1a2diK05ad0hKZHVv?=
 =?utf-8?B?VjlwUmNVNEJ0M2FOKzJpeGFnUnFNYmhCdGtGcGhDZFFKV2U5RkNhWExvREU2?=
 =?utf-8?B?c2dmZHYwdmVFY29zVEV1aUV1eFl2M0JnbE5hVEhuTjFNaGRLblFjTU45Unpi?=
 =?utf-8?B?TDJ2TmVMbWhiQjNDNGU0dVhWNG5rbUhHKzVoOVRRVm0zMVYxRUI1UldubWxR?=
 =?utf-8?B?WEF4Vm1xbVMwak9jc0RTTmZkU1kvSlNMWkdIcCtmVzhPK1cxdDlEbXdiR21r?=
 =?utf-8?B?Q1krTkhvU2hlc3QzalpOVjdudVpjRG5GcUpYOVN5L1lYWWdTL2hrNGpna0V1?=
 =?utf-8?B?YVJjaUFoclVhYnJjMWNQenZJZmVOeWV1ZDFubjQ2a2d4RWJtc1kxYk5xU0Vj?=
 =?utf-8?B?Q0FJMUNTZmc2RXVnVVNrYjRSL3lGTnROU1lWaXNmREtXZ2pjOUZhVDk5U1hW?=
 =?utf-8?B?UU5rZnBZODcrVmFKZVlVbVcyQjBweTdsMVJkbXkxTHl6TTZaN092cVFRR3Y2?=
 =?utf-8?Q?6TXI+FqyT58fTwo5ca?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4f2b64-217d-4813-6dd9-08dec3097944
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:50:59.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+huCxkNmT4eBeBeUmPKjN5vaAq2GwWnao3pPqgmDTXjiQbfIXm/WI2GzKljNK1X/6lnAkFB8xUdhLMY7GpruQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6784

On Fri Jun 5, 2026 at 5:49 AM BST, Yuan Tan wrote:
> Hi Linux kernel maintainers,
>
> We are developing a tool called FerroLens to detect potential unsound
> behavior in Rust code in the Linux kernel. FerroLens reported the followi=
ng
> bug in rust/kernel/gendisk.rs.
>
> Gendisk is marked as Send although the fields it contains may not be.
> Specifically, the QueueData held in the raw gendisk pointer may not be sa=
fe
> to send across threads. Therefore, sending the Gendisk from one thread to
> another and dropping on a different thread may cause unsound behavior.
>
> Additionally, Gendisk contains an Arc<TagSet<T>>. This Arc would be Send
> and Sync if the underlying TagSet<T> were Send and Sync. But this is not
> explicitly derived, although it can be, since the API does not modify the
> TagSet.
>
> We're not Rust experts, so we may have gotten some things wrong. We'd gre=
atly
> appreciate any corrections.
>
>
> I tried creating a PoC to trigger this bug and make our findings more
> solid.
>
> We actually hacked the kernel a bit to enable KCSAN for the Rust pieces,
> and it did generate a few crashes, but they are highly unstable.
>
> BUG: KCSAN: data-race in drop_in_place<...GenDisk...> / __srcu_check_read=
_flavor
>
> Here is the PoC I used. Hopefully, sharing it here in case it can helps
> anyone better understand the bug.

I failed to see how this is at all related to your fix, which changes no ru=
ntime
behaviour at all.

Best,
Gary

>
> ---
> python3 guest_kcsan_inflight_teardown.py --rounds 20 --inflight-threads 2=
 --io-threads 2 --io-burst 8 --round-cooldown 0.02
>
> #!/usr/bin/env python3
> import os
> import threading
> import time
> import traceback
>
>
> BASE =3D "/sys/kernel/config/rnull"
> SYS_BLOCK =3D "/sys/block"
> DEVICE_SIZE_MIB =3D 64
> BLOCK_SIZE =3D 4096
> ROUNDS =3D 220
> INFLIGHT_THREADS =3D 8
> POWER_OFF_DELAY_SEC =3D 0.015
> POST_POWEROFF_SPIN_SEC =3D 0.12
>
>
> def write_file(path: str, data: str) -> None:
>     with open(path, "w", encoding=3D"ascii") as f:
>         f.write(data)
>
>
> def wait_for_path(path: str, timeout_sec: float) -> bool:
>     deadline =3D time.time() + timeout_sec
>     while time.time() < deadline:
>         if os.path.exists(path):
>             return True
>         time.sleep(0.001)
>     return os.path.exists(path)
>
>
> def create_device(name: str) -> str:
>     path =3D f"{BASE}/{name}"
>     os.mkdir(path)
>     write_file(f"{path}/size", f"{DEVICE_SIZE_MIB}\n")
>     write_file(f"{path}/blocksize", f"{BLOCK_SIZE}\n")
>     write_file(f"{path}/irqmode", "1\n")
>     write_file(f"{path}/power", "1\n")
>     return path
>
>
> def inflight_path(name: str) -> str:
>     return f"{SYS_BLOCK}/{name}/inflight"
>
>
> def inflight_worker(name: str, running: threading.Event, errors: list[str=
]) -> None:
>     path =3D inflight_path(name)
>     fd =3D None
>     try:
>         if not wait_for_path(path, 1.0):
>             errors.append(f"{name}: inflight path not ready")
>             return
>
>         fd =3D os.open(path, os.O_RDONLY)
>         while running.is_set():
>             try:
>                 os.lseek(fd, 0, os.SEEK_SET)
>                 os.read(fd, 128)
>             except OSError:
>                 pass
>     except Exception as exc:
>         errors.append(f"inflight {name}: {exc!r}\n{traceback.format_exc()=
}")
>     finally:
>         if fd is not None:
>             try:
>                 os.close(fd)
>             except OSError:
>                 pass
>
>
> def destroy_device(path: str, errors: list[str]) -> None:
>     for _ in range(1000):
>         try:
>             os.rmdir(path)
>             return
>         except OSError:
>             time.sleep(0.002)
>     errors.append(f"rmdir failed for {path}")
>
>
> def device_round(name: str, errors: list[str]) -> None:
>     path =3D create_device(name)
>     running =3D threading.Event()
>     running.set()
>
>     workers =3D []
>     for _ in range(INFLIGHT_THREADS):
>         workers.append(threading.Thread(target=3Dinflight_worker, args=3D=
(name, running, errors)))
>
>     for worker in workers:
>         worker.start()
>
>     time.sleep(POWER_OFF_DELAY_SEC)
>     write_file(f"{path}/power", "0\n")
>     time.sleep(POST_POWEROFF_SPIN_SEC)
>     running.clear()
>
>     for worker in workers:
>         worker.join()
>
>     destroy_device(path, errors)
>
>
> def main() -> int:
>     errors: list[str] =3D []
>     start =3D time.time()
>
>     for round_id in range(ROUNDS):
>         name =3D f"gi{round_id}"
>         try:
>             device_round(name, errors)
>         except Exception as exc:
>             errors.append(f"round {name}: {exc!r}\n{traceback.format_exc(=
)}")
>
>     duration =3D time.time() - start
>     print(f"kcsan_inflight_teardown_done rounds=3D{ROUNDS} duration=3D{du=
ration:.2f}s")
>     print(f"errors=3D{len(errors)}")
>     for err in errors[:20]:
>         print(err)
>     return 0
>
>
> if __name__ =3D=3D "__main__":
>     raise SystemExit(main())
>
>
>
> Yuan Tan (1):
>   rust: block: mq: make GenDisk Send impl sound
>
>  rust/kernel/block/mq/gen_disk.rs |  8 +++++---
>  rust/kernel/block/mq/tag_set.rs  | 11 +++++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)


