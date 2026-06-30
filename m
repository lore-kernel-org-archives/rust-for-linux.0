Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022076.outbound.protection.outlook.com [52.101.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4B3F54AB
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816733; cv=fail; b=slzHCCkaamYmM0BQzsJaslkZ1Ttq2ZAb9ZDAHMUNXLtZX7bl2enXAb2lcP1NED5a508OlxAjzn4/iQp/Kr8+r8+pAMnW4PRk5tovEvtj/YtEU+2DnIzlx5QHWYcMa2F4PIpvCsGSE5uaHa846p/hff6cQk2Ufkp6maxDbxqTRE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816733; c=relaxed/simple;
	bh=UxUwDmy8OnDeOxSwEyorAPc3M6eDgV7w5EBrixsavQE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YUXjh1riHq6fhTJP4AICbt4IP6IvZVbmYMd39yy3+LmxRAy5FqsW+MzdJSyY0ADFHFInbIqG6XEIA4YbhljSiLeGyDIOrGWVExB05+/NwBHA3ednHxDRQ4gxnZvAZ4I9lHY1lfNRTWLq/Ni9a3hSLhP20dwpcQZfB4Jn4wgQLrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=H907LTzG; arc=fail smtp.client-ip=52.101.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="H907LTzG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML/qdd55P02apqdABjoh/lQ/CYyXBSQW8xvC1wmdyGUZ4nMKIeB9k1JBw3Z+snAF6Lwmc8+WR7k8LCvNbLCDhSUXO9Fl7aYdo6+mppKrN6KrpVEPu+F1HYfnW2tWVAWi4SZH2QkV6Dad8848gO9kK+W/MnZAIpfqPA1B1shuaoxGj5wpobSqb9zeYPDIcuLcTyxRmTdUa79nihzE4w6Du0Xfgrm43TKQU7yFo1EnVcBN9sS1a0SSregIovd5V3dRzIjzcxDJt8hpw1dwyXH1gVUZuxlnS4uYiyq/8DPSjvU0D4d1rixq9/7E6Q6+ZPdYt5GBdjTDrgGf3QTcYwbcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2JCQOD8hFGRFO8SG6x7JVaHlsWjcLfeThtwni0+BAw=;
 b=W54sbkkCfDOitJhVlQTHFCzuDMhN7Fp5kiN5IKMAeeGxj46363hMCMtdKOkl9VzXRM+4CIHeFyOMfFx9D2ryPE4QkHj0X/GC9drCQIst4+5TuXqHqUJEBR7ewzYEvXhMBwcnw+UKri2r6Wd6L6+xEZgsCRR0MlUrzyA9eL85UNMtaxUIlADV8ZpnmQX6aeLc5hH0yqOymgTie/29VdOMTEz5YF0TYIqHu0anQEkSIz+ntVUbies7M3KcSBHuolQfjO9YoXLSqghiOcbGIhZmDTr0e+xPnhpF44dkODL5wvhIQo5kWM9Je5HRaxLu+Jr1wJUBBSsWvybAmBKLFFhhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2JCQOD8hFGRFO8SG6x7JVaHlsWjcLfeThtwni0+BAw=;
 b=H907LTzGigdmNv34azSgEgNXxyUOtUwj+Tw+CeJadur0mDXJdQwiLj+ioZ8eYirTpszekzkwUX1vBZUzte1MOp400WmV83dCgZXDvhmGBDQbmxDUsyyFkUadpjhdPOMclryvWkbnNdG85sbXUwgf8ewZIlCA3Tg0nMF/WUIu2NY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8724.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:52:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:52:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 11:52:00 +0100
Message-Id: <DJMBS6S3I8NY.2MF24W7P3DQXJ@garyguo.net>
Cc: <peterz@infradead.org>, <zhiyunq@cs.ucr.edu>, <ardalan@uci.edu>,
 <dzueck@uci.edu>, <yuantan098@gmail.com>
Subject: Re: [PATCH v2 1/1] Make Guard::lock_ref unavailable if Lock is not
 Sync
From: "Gary Guo" <gary@garyguo.net>
To: "Priya Bala Govindasamy" <pgovind2@uci.edu>, <ojeda@kernel.org>,
 <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1782763889.git.pgovind2@uci.edu>
 <878cfb22ab185874bc363e2b7910a6978af646ab.1782763889.git.pgovind2@uci.edu>
In-Reply-To: <878cfb22ab185874bc363e2b7910a6978af646ab.1782763889.git.pgovind2@uci.edu>
X-ClientProxiedBy: LO4P123CA0569.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c8d35f-e588-4856-d29d-08ded6959d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|22082099003|4143699003|5023799004|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	p7sgdDK73T0Q4gb9lrICciJ8bMGwRBoljyCWKUmhtPqVfXSOBPrScvudRSxb/tcxp0f5pXu4YKQgmMWd3UEYt1NIpF6jFqbldKkL/6nnLLsOLePcLVt6CWTXdqT73Mu9EMhcunKnTawTsKNJD7pxIbZW+UHx42MQ0mrdU1EJNCahdK2hkdNwTgld7LRa911f58DXRiJhNQH6gpsASiJpo11eqs/ndutwC3YiztOQ2v5AX9qm1/IPprh5Pxlt4dsEbRVZsGD6djjXFgqg939cubAjZD2Prsr9nFbToCTYgyvRX2mBy/JVL5Vopj5Ap07WTP7byOKmfQ2/y/dVibk0KqCRk/n2/U0c9XgTyCHxJ50TmkrLAyz8AGMg+d3FlqJ+b4z8RUTx7gpsNeLj6f/ULovfaXeDvZKn6MlnJOC24rcihi0D+WqX72HDaJmcH7Cm+nMQUZtOnIYHW71ft8mNvqFHUtX0deHaBhoVgxM/fqnFKuJCr9nUQVbUDGBzILFO+HHPtCN+HgSx4qAJicky47lf8am0e4qrANq1vQSlLpD9vxsvgfvWSXM9OI+7niQObjD0dScivpmU8ZSFVvYfgba7bkYx8jo2JPblnPofai5ZfisKpSrBr8cobNk02JLUZsvRp3nxyw3/Bp1QNsS8m1u2+CrB125MwPT+NsDLiD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(22082099003)(4143699003)(5023799004)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCtMekt6NEdJZWxtMGgyN3NENkM5bGpvL29FRDBTYjV5N2NMdCt4TnhCL2k3?=
 =?utf-8?B?YWY2UVpOdG9UOGNlK3lkRnlrZGlCL3pMN3ExVHZRZDgvSXpEOFZ0bWtjOG1R?=
 =?utf-8?B?dVZ5U3RWMURhSDB4ZTM3OThVQTZQRVRIQVQ3Wk1sdENTRVJKcEk1Y0pFanZz?=
 =?utf-8?B?dWdETnlpYlhwOE00eFYzWmpYbDdWVnA5TmMyeWFFSkE2QUhCNTVQdC81U3Y3?=
 =?utf-8?B?MHpBVEMzdWJoNUxYQ1Z3eVppTXg3WFNza0RpaWp2UFE5SXNkOWNkVlRuUzdK?=
 =?utf-8?B?dmxBVFpxaFMyaUpGT1dwY0dhM284MmFvdlo4TFBjR2FZcmpQU1VKUUxadGV4?=
 =?utf-8?B?OTI4bWFFNkVFcFVzdWZIa0ExL1l2M09XOXA4MDVMR0lOcktVZjhRSW8yOUMw?=
 =?utf-8?B?dW9FZkwvUHpISUVldjFVSTgrWFA4MURMOFUwNWdOTVpMcWdnMlAzVGxuaWRt?=
 =?utf-8?B?TzVtc0JWMU1Vbkd5MzFmOU1yNWtleExXazNwMWgzc2lyTEFocE03d1pFWElW?=
 =?utf-8?B?RG42SnNDd0pPWmtVOURlaUVHWWhNQVRlS3MvOWdUZDhlajRlWW5DaktjVEtJ?=
 =?utf-8?B?K2M0VXhUaFNKWXlYa1VVSDZGZWUwYkdKM2NHRy9CaFBqMUNjM1ZyQWFONHdh?=
 =?utf-8?B?bWR5WWV0ZGk4dC8yWDRadmxBbk44MFQzKzgyZFdpZHRGRHdoMy9pd01XckNt?=
 =?utf-8?B?N1MvNWdjNWxyc3NrZzJrcXZVZHh2ZVkrN0ZCZ3hoRTdYRFJsQlAvRmVCS2Jn?=
 =?utf-8?B?UitZSjVqUEU3dTQ1RmtvaG1tbWE4b0hxWFI1a0xsT083TUMreE9EeEZ5Nkdv?=
 =?utf-8?B?RXJ2MFQ0ZGlHdzRZeldEOTc4Y3FzcnVFYWU3Vng5TkNPRlhVQ05KYmM0SXJ1?=
 =?utf-8?B?TlRkemZPTGpIOFluMjZYTlM1emdFZ3dnUTJlRHhnaTBBYmgyS3VCeVNTZjZj?=
 =?utf-8?B?bk1McWRuZU5tTll0QmRLZnVRaFJRcTZwSUVjMWlmVGNDZENYd05lcVRLYnA1?=
 =?utf-8?B?emdFUjVkd21ueHUxL3RrbExOZG5CNEZtcldkL3hDeGZHdzJubWxwU01oNlpQ?=
 =?utf-8?B?TWdjaS9EME5nU0ZyNE1MenVaeXBtODRBT0R3NFBRZXFBVzZteFJadFZHWXNp?=
 =?utf-8?B?SmZCUUUzUWpJMkd3Q2t5MHpQWCt0ZWFzNVdXTUZScGhuamwrSTBzeC9JWStF?=
 =?utf-8?B?VnlWajNMMFNUODJ2Z0FkdFdVT0FsQXZPTzRTbk1iUDFoZStDQjBmM01lSnVh?=
 =?utf-8?B?NUdsTk56UUhNaE9TVUJ5dGhOdE1pMmgwODdnSyt3aENScTF4SzFUYUUvZFhn?=
 =?utf-8?B?Qm5CckI4WHBjbC9sUTNBWnZiM2tyOHZXcFpBUitSaVNWMEJKMThRQi9pVHFB?=
 =?utf-8?B?ckt6RnB0Zk1qNEtyeFB0L0g2T3kzdHIwMS9WN3EwSmRzMEF4T0tWS1N6TUNQ?=
 =?utf-8?B?azczdHk4bVZQYUsrWDJkd3NrOGdycjRLYlk4Q1dQd2pIS1NwMEdEb2Fna1hK?=
 =?utf-8?B?R1ZCVlJXbGZQWmZ6U3hpY2N4bUg2c2MrUTZDN0t4czlyaXRoRk1EYmpqNHQz?=
 =?utf-8?B?TElXazJ6bWFDUnBOMWU2NGtkSWRUY0dUa2xsRVpyQUx4NndLaWYvWUZ4R1p5?=
 =?utf-8?B?VUtWa1FKTkMyWS9PL1ZsNHp0amV4WkhNajdIRzBIdFRyMGxicjZXakpyRzBz?=
 =?utf-8?B?eVhWOFYwUUxtZEVPWnczUitNeU5acjBkS0tISk9waWNaSDI0UmhUbm5Kd3dI?=
 =?utf-8?B?SGh1SkU4NGt6Z1ZMVEZlb2FwcEpEWWpIajFEZmkvTW83YlZCUjhMbFBDcVB4?=
 =?utf-8?B?dWRBanRrbnRzL0Y4QmszV0ZGSGhPVWFOdkRKWkZiT3FBSnliemlPVVVXMDZt?=
 =?utf-8?B?Vzk3dlFITmJCWll4L21tWW93MEVDUGttQ1REbjdNL1hUL2JpaURQdzhKcml5?=
 =?utf-8?B?NjNYaXNkTDZ0a3FvRDZReHlONjFMNFpoUjRtb2pMM1dLODYzRjVoK0tsbllq?=
 =?utf-8?B?NTIySUg3aENhaGNjeVQ4OUN0YnJFZ0N4eExDbWJFdXFDa0VLY2U3SkpiVUhK?=
 =?utf-8?B?MmJyc1YzMnBGWlhaOG5Oak80WTdCUHBLbUdWcXpDMm8zdUdwMk4xbVVWZ0x2?=
 =?utf-8?B?WXpuZmRnLzNndmJyQmhnT0doMlFnemFEdW5PUjdIejY4cUVnK1BCTU9JbVQ1?=
 =?utf-8?B?V1dSZVZIWW1xbFFtVVJnRDI2VU5ESUttbmFNNi9WTStpSDNWdUFWVnZ0c1Uv?=
 =?utf-8?B?MXlJdWg1SG9NakgyUlBILzNFelp1L3Q2N2xBMUVSVTJxbGpyZVIzVHNhK2xa?=
 =?utf-8?B?SXhhMWRVTVcwdVF4L1FTZlJRN3QvU0diSmE0NEY4dGZuMWdmV0Nldz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c8d35f-e588-4856-d29d-08ded6959d2d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:52:00.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zpz+HVnB0/0v49xLPVsznmMSBbOulgRfPKD3dfeaOb33kVNmbGCLnpU/ZQ4Yfy6AaY82AJ9FKXtYNGSXoAt0dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8724

On Tue Jun 30, 2026 at 12:52 AM BST, Priya Bala Govindasamy wrote:
> Guard::lock_ref() returns a reference to the Lock stored in the Guard.=20
> Guard is Sync if T is Sync. However, Lock is Sync only if T is Send.=20

Please quote code with ``

> This means that a reference to Guard can be sent across threads and=20
> multiple threads can acquire a reference to the Lock,=20
> even if Lock is not Sync.=20
>
> The following scenario is possible:
> If T is sync but not send,=20
> Thread A: Creates a Lock<T>. Because T is not Send, Lock<T> is not Sync.=
=20
> It cannot be shared with other threads.=20
> Locks the mutex and gets a Guard<T>.=20
> Since T is Sync, code says Guard<T> is Sync.=20
> Thread A can now safely give a &Guard<T> to Thread B.
> Thread B: calls guard.lock_ref(). This returns a &'a Lock<T>.
> Thread B now has a reference to the Lock. In this case,=20
> even after Thread A drops the guard, Thread B still has that &Lock.=20
> Thread B can now call lock.lock() and get a &mut T.
> This is unsound.

This is way too verbose. Please be concise. Something like

    For `l: Lock<T>`, this means that `send_across_thread(&l.lock()).lock_r=
ef()`
    is able to send `&Lock<T>` across threads despite `T: !Sync`.

should be more readable.

>
> Fix this issue by adding a trait bound to Guard::lock_ref so that=20
> this method is available only when Lock<T, B> implements Sync.=20
> This ensures that multiple threads cannot acquire a reference=20
> to the Lock if it is not Sync.

Again, this is repeating the same thing with two different style. Typical L=
LM
style verbosity. Just remove the second sentence and keep the first.

>
> Fixes: 8f65291dae0e ("rust: sync: Add accessor for the lock behind a give=
n guard")
> Cc: stable@vger.kernel.org
> Reported-by: Dylan Zueck<dzueck@uci.edu>
> Reported-by: Yuan Tan<ytan089@ucr.edu>
> Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
> Assisted-by: ChatGPT:gpt-5.4

Acked-by: Gary Guo <gary@garyguo.net>

> ---
> changes in v2:
> - Add a trait bound only to the Guard::lock_ref() method. Changes to the =
lock lifetime are not necessary.
>
> Link: https://lore.kernel.org/all/20260605022400.31489-1-kentertan12138@o=
utlook.com/#t
>
>  rust/kernel/sync/lock.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024..91317d0d81b9 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -234,7 +234,10 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
>      /// // `g` originates from `l`.
>      /// assert_held(&g, &l);
>      /// ```
> -    pub fn lock_ref(&self) -> &'a Lock<T, B> {
> +    pub fn lock_ref(&self) -> &'a Lock<T, B>
> +    where
> +        Lock<T, B>: Sync,
> +    {
>          self.lock
>      }
> =20


