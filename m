Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020114.outbound.protection.outlook.com [52.101.196.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADA2144BE;
	Wed, 22 Jan 2025 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737557819; cv=fail; b=Z5oHXc+ZrCvyyE2/BrYuhlveFwOfRy0oAQejzYowk8fhPIImx9XH8G5Rdgp1vjnQxltaDgGO8Ic2EycmpbPD9NWTT/Xtyx4ixy/mUAbIAEg3j9rYseJysy+U5IdJ27MpHT4NINP/4aGnN1+GwM4fNe2nRue5ZMZtahzanscBN9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737557819; c=relaxed/simple;
	bh=XLa8D6qLZNyIp/aHV5SUDeeYxm/Vd3zNw6DKTALQD1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6awjuoax0ZGoWQTHlw78vlpGdx6qQQEE+PQ5WlbORt5PWIJdlpjwaQiI0dTcHWF1D6L+pTk4i3o/a/kkvFg/jR1E6u+sIgocdVqOhfNBpFGjuNJ6L1E0dO3/bLv66bfEMPy/pG6JDGqhipkxnQ0urUygSsTMqvWOWihVeceO0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YQBB07wq; arc=fail smtp.client-ip=52.101.196.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YQBB07wq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkul+q2QewSZe71cRVm0xyoUlFLIxzZ9rGY1wNLhrG8JLIK52kRG4GtHauQRVVP6zpr7lDEFmuCd2RIKjWG3r9hGDwIHbi0hGwOi21JytO7FBzp+kHeoJA9R87pze1rweFLoL/MLBaMZDXwlg/EXl2OdRKlbAlC9A7Xi4uvEHpNKsMEbgJt5oHv2HXH2gr95MtRZsbXhcJXjOVWjKbrYPr03wllZ0eJoielcMECtp1M3SRFkyja4iYV9S2s3gXeMk13t4RvqpMFOh1ob/TpObVR9wld4T5apq/uGxD7c79H5Vqnzg4RiO6D7zEreLBfN6WmRZBR7Vtv7y4sRALlrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBadUYVPv33vn0IAgcGcBx53QWIW2AX4zkGAji6BpzQ=;
 b=nBYus9TJJKwbR+03b0c0kix1n75z3M4HXRM40QgnODukWv8p8xC+9e7w34CfITXpR3VbBAj2jif74u2FPGdy8UzT3Oo6tLanFlurJYRDTtthh1hQy9sEERMEPSSmSwbmwxB6/Cw1u8oZSMQBWDL/d0Odl3s3eEU0ObGxH45sZvlgj1zQ0HiDa4tcE89Fz8m4Fnoh1/qaTM3zlMrTRBo4IJKvqi/fhhAdvw9arDwuFhWFO5ES3eM+aj50SLp+xosNeUBFdKhgCKGjo9OckFaKCSZTH/FNzyQux26d3dc8/LgzhYhAsI6hzDWS3OT6lwwytvFNiA6K0U39PgLM3Uy1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBadUYVPv33vn0IAgcGcBx53QWIW2AX4zkGAji6BpzQ=;
 b=YQBB07wqsiGfJgoE7ZuDC5IrZpfo1e0zkDu8D4OnURlsOAWlOhsBL/Ih1iMYlkcSHItitDqWQFuG4K1qmA38DnWCj57SbtUMVLkOXJROdkVY8HuxjMgHhPlcNLHX5HCQ2uYdIsD21L3D3yN54HyASu10T00rmpPbZCYvOspcFeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO9P265MB7567.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.23; Wed, 22 Jan
 2025 14:56:55 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 14:56:55 +0000
Date: Wed, 22 Jan 2025 14:56:53 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Fiona Behrens <me@kloenk.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: move offset_valid and io_addr(_assert) to
 IoRaw
Message-ID: <20250122145653.4ce76a01.gary@garyguo.net>
In-Reply-To: <Z5D_IxCZvcZ_jKd8@pollux>
References: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
	<Z5D_IxCZvcZ_jKd8@pollux>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO9P265MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc440b4-1c3c-4f0b-1b97-08dd3af50321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4BGRN7n5jeJEwFZwwUWsUEt0dWfB+duaTFtMLT1X6fWwmP3fYhebF259F+FG?=
 =?us-ascii?Q?OE3HB0J9ePhYYMRRI44wHclOCbyxbJTzmR0rhsmQw91XZ+jdxxIeMz3dxc19?=
 =?us-ascii?Q?TCqs4uo7s7agGDNHfcGfVlFh/KjFQfQKIO5jB/HlZtqsWVqqnTQclezqmYa+?=
 =?us-ascii?Q?P3UymfMxGKwbM4GMvFoU8wlRwIOVkVFCv3cIemUsZVVAmmnlryXHAeKtVyQc?=
 =?us-ascii?Q?pYagwJ+xHqzYiK4CO+TBl/haqKAObEUGMqdC5z6ziQMadDN0QwvzpJHS5/bP?=
 =?us-ascii?Q?waTD6+yOuv80P0pdprzqkxgE3B9+pbRv35/VF8bU20PjQUz3zd41MhaTqiDw?=
 =?us-ascii?Q?GYTNFwTiF0cZZVJUdP+N2IwhpjiJ+HEz3swKv9zrRqXmQfu28meDI1NT/nSY?=
 =?us-ascii?Q?JeGjxxw7qKhlVUPcd5nYRIt/srp582BzUV90u8M7piuAQaSuRbRv024YGEAw?=
 =?us-ascii?Q?phsmOz+UBsrnq6/Q5+5k8VjVOa3mY4qNgQtPC2pi16hHMty4tlaVEAXkBFXY?=
 =?us-ascii?Q?38H2P7y62oaVtycSB7LMMRCNXS7IasiipBD+cNaz+AW5TYOvCFKBHX8uGMxx?=
 =?us-ascii?Q?c2IzueRA19YLA1F8gLSBN5k6C7HKifC9vmpqiVQVleErAwOorFU7Y6O6djbz?=
 =?us-ascii?Q?t+vttx4/jMBcAv2YXnUWYDceO+vlI52hFb4lvsT2uc+kQgg3Ng3RSNPXLwNq?=
 =?us-ascii?Q?6Jzx08otPxljsSoWB1Ksf4GTNBS/6VFH+aPa7qOd1I+XlDzg7bq9laXNMftQ?=
 =?us-ascii?Q?3y22K62K+P1qLhF3cUEH59uA19JgojHny3iCYw0w4wPhyuOP3x4ayAlkRLPU?=
 =?us-ascii?Q?xKwviEE03OArx6yH54OkNOle9Mj35bTC3U/ekhXYMBgECh30dAnnfPvAs31M?=
 =?us-ascii?Q?981LGI3Q6VEQxZmAFjkAYLIlal+71DubBWKn9OjmQg7MvcUB3FCoW3f0uCoc?=
 =?us-ascii?Q?grbUMMZmeGu0FzaIXbH1sNkga3CzlVsrlxbXOg7WhjhZVo2kYdzhcWtXVwP8?=
 =?us-ascii?Q?+SV/MPOicvW7q9jX9SS+GtdNAXoV2P6/VACNbvXUwUTw9pnlX/PvGNMo+Lve?=
 =?us-ascii?Q?5dQpVqhvdp/iASVWLPst3mXeiGYd5232M/WCNwnnbi1ScBQHuytDUsXk7Ouf?=
 =?us-ascii?Q?5mCPhLe/gOAE7LGuGWNvF4cVRmwlEz6XaNjZNRLIeAdtK8jIgvF/n/3I9Y5s?=
 =?us-ascii?Q?dmp/wRdq7jpgo8TswHZMJgbkgNUfMRv+xSKp6qp0H4bXHgZuQB9BZoyujhw4?=
 =?us-ascii?Q?zakI9UCyYaNo5SqOmgh0J40EpYTWUuEe38BQPICzSq5j7Q5hgCQi4/C2p7zj?=
 =?us-ascii?Q?XNqQT5CT1c2Qw1xrL3WJu48VnFyovI0n/9Wv3LNtaV4lvn9Zzb3K/owtn5Q1?=
 =?us-ascii?Q?r6zf0YaXm9qKhc4qvfqpY/x9Cc0I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MjvIidQUCoj3DzI5ykoTKb0fckr47xWXB5A+u9VXIolARPKlyfyp18wdKztk?=
 =?us-ascii?Q?ZDuFNsVbfMHRS7s8KIKhy0LLFwBTQY+BmhP3QN7kKF6M9AQuze5DLTJg5epb?=
 =?us-ascii?Q?S2zTLFxjnZA/2jrIUW/I8WQZIPPGnqTeF0BVFmaoSHPJ2hjAES44HpEAykMY?=
 =?us-ascii?Q?0HECUawEWV5qyUJA5ORTTzFJcWuJ0k38CChdZ14FM/Y74QvS0j8HWaAQ+tZY?=
 =?us-ascii?Q?mwOHQSW+MTW5ypDnhx8xzo/v+4mfYscuWMRsAsnuvLkbIfml+X//NYCPBNKo?=
 =?us-ascii?Q?1rd8LqX8RsWangveviLfU+6tPR+e2GO+X4m4rJXJyD36nbFSl8DxUzEfXA1A?=
 =?us-ascii?Q?UWshwYvz1cSHSm4/rbuRUog2Vw5jnur1HbUUz4ZjP+i56LWR3KVRvHtwGYYw?=
 =?us-ascii?Q?mGTeE+X2xapdnQOlNcoL2H5UlNp6pVF6LOxKoNRCyw4PuAGWUfaW2bg7NWdk?=
 =?us-ascii?Q?ofnT3M7biTd1jnfnmXRYMcJMBC0UVvj8ikZk0Y9iqGVL4ePWJb/Hj09dEulT?=
 =?us-ascii?Q?gNCo9V2v86jY895w6pqIgelpIBj9PKsv633L1p8MmS8/5n2KV7gdHNU7lQam?=
 =?us-ascii?Q?RFVaJ09XpRBd8DtmUoRsSjns/okKkeQI0XX0RyibjnrBGZ0rBjbcxsApJE3W?=
 =?us-ascii?Q?+nFYGs2YHYE57cI8eFMn6yDpEJHqP+GRxm57ziLD4O1JIZBGBN7xYBY9ve8z?=
 =?us-ascii?Q?HV3rte99yGm9acJXqcmivtNP56+Ra6n1B1vWYQIBegyK3QbmM/kYougtouZq?=
 =?us-ascii?Q?RIXVqUC59XqoNbrSH7Ww1zhJQtzPx3vLX/f1ptqBiiekP6JxaO9UNRQr1mOK?=
 =?us-ascii?Q?hqmaWQJ4GKIFkKMuWucaxJkVllV/56Am04UoQI6jfxy9fK0tInSWbckrseGi?=
 =?us-ascii?Q?SRba7k2lWM5m5YvErio6VrSqHIXfK/HF0moUBTFe0FAiHD8/BMN9NRPwOuH5?=
 =?us-ascii?Q?gxzhipcmCRM1cgZyq0FSSQCXzWZ44JJmXTh98H3jk3CDiiLjsnT5/Z+htX73?=
 =?us-ascii?Q?BphH7fRxRTnLCA22DVooYG3hZmI5MGt12YLa+qyAd/4rwbEODft+abRLYJGz?=
 =?us-ascii?Q?Z2DfOQAO9uaJVdKSzyHy8cw6xYAKhfl9s58VOv2F5prcFBZDHadDY+zWtQNq?=
 =?us-ascii?Q?NTKczh5faJCxxOcHzeBUoqiRtS7SVcnD3Jp4xs0aRShK9yZjnHsZMJFy+BGE?=
 =?us-ascii?Q?JiltaIuvOM8Iejja0GcmXAdseERMuT+7eWEMpcgcejrBwTjPigDPAWV7Ymiq?=
 =?us-ascii?Q?iFnVOoMqPHZ8tz/LXZXVjjShV1TlK+wGgmCI6DWmDad/kuDMoLhx+utKxQyL?=
 =?us-ascii?Q?A0czk8PlNbiPTFfj130akSAiReznfp9NlQd6fT8cQ81e4liX9i3MY3mHZMRC?=
 =?us-ascii?Q?/wfEF2AXlmytEhv/nNhOxReB8gqaD6CBGLsTQR6c+f297clicoInn2ulMoqy?=
 =?us-ascii?Q?WTtDF5GLIAj4XuWX0+fw8+eXNwifvfko5nTqV86rDbjaeUslq873Sc+x6VoC?=
 =?us-ascii?Q?8+ExR1QK2LcK2pkELqGpECW7Q5MZFBcZaKmd3XOa4rjhle4zqmkCop5FzJUw?=
 =?us-ascii?Q?vN56nnipD5SA01yCdJz3xh65JZEMVAKdQRnALPwHWZXnAU3Rok9+bmtxyoGh?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc440b4-1c3c-4f0b-1b97-08dd3af50321
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 14:56:55.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 643WxEyGDwD4u7yK1LNCa+pEoUpUjVCBOuJDcIdjaXj8wG1MUha/l8G5uTaG4w31FQ+D8j6JUm8vI37txwz1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7567

On Wed, 22 Jan 2025 15:22:27 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> On Wed, Jan 22, 2025 at 01:38:09PM +0100, Fiona Behrens wrote:
> > Move the helper functions `offset_valid`, `io_addr` and
> > `io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
> > if other abstractions with different write/read functions are
> > needed (e.g. `writeb` vs `iowrite` vs `outb`).
> > 
> > Make this functions public as well so they can be used from other
> > modules if you aquire a `IoRaw`.  
> 
> I don't think they should be public. Instead the abstraction for I/O ports
> should be in this file, just like `Io` is.
> 
> Another option could also be to just extend the existing `Io` abstraction for
> I/O ports.
> 
> > 
> > Signed-off-by: Fiona Behrens <me@kloenk.dev>
> > ---
> >  rust/kernel/io.rs | 98 +++++++++++++++++++++++++++++++++++--------------------
> >  1 file changed, 63 insertions(+), 35 deletions(-)
> > 
> > diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> > index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..a6d026f458608626113fd194ee5a8616b4ef76fe 100644
> > --- a/rust/kernel/io.rs
> > +++ b/rust/kernel/io.rs
> > @@ -15,6 +15,11 @@
> >  /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
> >  /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
> >  /// any guarantees are given.
> > +///
> > +/// # Invariant  
> 
> You phrased this invariant as if it would be a requirement, but it's more like a
> something that's always uphold. I'd phrase it as a fact that can be relied on.

I thinkt the use of `Invariant` here is correct, as this needs to be
uphold by the constructors (and only then it can be relied on). However
the patch doesn't clearly indicate that.

> 
> > +///
> > +/// `addr` plus `maxsize` has to fit in memory (smaller than [`usize::MAX`])  
> 
> "fit in memory" sounds a bit misleading. I think you want to say they have to be
> in the range of some address space (e.g. PIO).
> 
> Besides that, why do we need this at all in this patch? I think it's fine to
> add, but then it should be separate patch I think.
> 
> > +/// and `maxsize` has to be smaller or equal to `SIZE`.  
> 
> That's wrong, it's the other way around.

Yeah, this is wrong.

> 
> >  pub struct IoRaw<const SIZE: usize = 0> {
> >      addr: usize,
> >      maxsize: usize,
> > @@ -23,7 +28,7 @@ pub struct IoRaw<const SIZE: usize = 0> {
> >  impl<const SIZE: usize> IoRaw<SIZE> {
> >      /// Returns a new `IoRaw` instance on success, an error otherwise.
> >      pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
> > -        if maxsize < SIZE {
> > +        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
> >              return Err(EINVAL);
> >          }

Best,
Gary
