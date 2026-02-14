Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020078.outbound.protection.outlook.com [52.101.196.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7A3EBF3A;
	Sat, 14 Feb 2026 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027988; cv=fail; b=XKFG9fNxj6iAWMPXTtQJRyH0l3iioVMgFBvo4MCaIEsQq4VVtigszZKcslrb7n/YhlmKXkAq5bdxHNaGqhxnwsDDKmA/hxFD5BQc5qM3rrdOoX0jUOkU8QtwhlIAEneGs+aquvXSdLa+Rvwb2fh+GFXiZulltANSvgUnMibBiUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027988; c=relaxed/simple;
	bh=yYNuxZNIUntp/SbZxYysBaKf8faJ+TnZHLjQjeGNHfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=vFc/6A3nB/SoHZ8PdnFM4LqF00iirJYkLPM/tAzAC6oa2WWfBZ/+tGiufAb+ua4/ia4zRRbb3cwVJCcX5zolVoZAYSUmDOHbdCE5TIM+vk3eFaTx7f7vsPaHp25gPUlghzHV1OGQdhW4rlf3MgsS4bhrk8QEb8TcH+Zx0xUj5tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ob+4itmY; arc=fail smtp.client-ip=52.101.196.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ob+4itmY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjhZ7JFpBMWD/sR3RS3bxy4GQ6FF5esEXRXf8EJXwTtTUhZQxjv/9lr5XX/HLq69MyEppnIpU/kbjhGBUJMPalRbK7ATN9QsFVzYKoYwF9KmAYwQAA0hWFmzv0MDMvpxq6EQICHgdOkwXT+LfT8em3NOHVhx0S+qBwk7ctZhjeZHmBLqBl+aSv/tmVUmAU+MAgmo+Heu8/tgkArbhPoepgBElCV88dE96CkNxwlbSxbPxI9OHkJezsBqhFt0ANqkOHeQoNNX11CuM1V6OUhKQLK98B48aiEInnwtpkrCjb7q6cp7W0ulZGXnu4sIz7X5uW5T7rQ80Stt4SrplYJ5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVIHdd1mitMWxxgc0rEjPW/e11AvcBQK9TDDPjEgiTQ=;
 b=i4YkxS8vMf6DRac/F3iXyjfQI8nOur/F2WU3B94lH1QWyt+tWpRZ78F8wqsWqFphDtsjcYsXT2IstqoYMx+GPCv9+2ohMaMkKIgdDuCIRyBC/c/F3ml/3wMgxVP8iMepfVrp3TASMQSTsLUOAh47WYAF+uVLFoSV2TMGaWDKpm8kmgr6In8WkrV6iaDySa4LXLzDH1OsViS3JezQWOqdt5zutAuObUUTxTRr73QVEs6sAhgrilMlX330GrmaCxM67LUqniJ8m1ZpkWfkBGRJIvNo90izv8guaSBmbbhzfq7G3VK6eURErxjuqvXdzljygdCUffcHigXvVdhZIqqtIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVIHdd1mitMWxxgc0rEjPW/e11AvcBQK9TDDPjEgiTQ=;
 b=ob+4itmYZfPNCjI2mlUYOTXcnloKrTK6MhtmKJ+fZ2/MQ/OHFqanDMHBX63vjZXB4KTr/m8nnivHhmuIt6lnUlxf+m7/9Vn6OfVpVR4bohGE53NQdhUWn+0Jt+nxdC7UTQAI3NfSyLxQN1TxautygGJzxgoyUJ1V5C7wjdXmpFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3083.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 00:13:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 00:13:05 +0000
Date: Sat, 14 Feb 2026 00:13:04 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: impl_flags: add method to return underlying integer
In-Reply-To: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
References: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
Message-ID: <b3388ec6cbd8f42532e876737e015e15@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3083:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fb383a-925f-4b98-64a7-08de6b5dd325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhBO6QzLoUZ9wZva9DTEOE+tine7XG6bxOrp7e0HX1KudnWZNSoCS7O8g/Yq?=
 =?us-ascii?Q?uA1V2kstH1KKAQLVNdcUjk5Ar72gQw5wiAhZKNIf9zsfNmFdhqV1sE0Bply8?=
 =?us-ascii?Q?YNIgKu/Aw9CKqQaBsKviUtbSXhmPCYGGpDY7MZAaoWItvfXZ2Rgsj+6ka7+2?=
 =?us-ascii?Q?jMhKQkQnXyTpB9v3EpqB631WiCv7s+YXmt8+6PJJyr9KQ0JvC9vaKlAuje0t?=
 =?us-ascii?Q?9uudYHbJ1Dldt+FGRNxTKX+ZwH8LtW1LeE1F7brfHiGT4rSVO1AAPOaDWacZ?=
 =?us-ascii?Q?E0aQiXZ/OpNLnp+Y5SYHNf/skk+GJnZArHlA65VpWdufaIXXrYi3LndMxXaZ?=
 =?us-ascii?Q?rmL9JUvy2D9j/RB2x14O5nvjFw07KbmkFbP/+PA4TQinrIMF9IHsMDf0oeKU?=
 =?us-ascii?Q?4B/zaTVJYfs2x/Y9Km46DzsSkSlRQBD8bT6BLPPVOW63/vZOVeERO6V49pry?=
 =?us-ascii?Q?By88pCnw79eweboVneHTh6XsBBlvSNttxD5ZSVDc+Y/NkOcxHUYLysc5JhEG?=
 =?us-ascii?Q?ksr2UlBBvbexw/vLMh0aVedQvKb+BERlnEIF59PhYnURe3c9TUk1WZpwZxau?=
 =?us-ascii?Q?3l2Hkm/DTk1OFJY47DmyDWc/R9NpxOk5+5Rj0RsHAwDcDGbA8G3ucH6Dbved?=
 =?us-ascii?Q?P6SWgwNEwBJVkQ71ruGvtQ5VTV6oGnSivEOt0UKZ1sTkKUGNs+pbtLF/5Czj?=
 =?us-ascii?Q?kKzp4lTeQrluXzWRi1E89W8cUIJiHFtR2c69e/EtKzQrGAOUQF3rvCcu7tUF?=
 =?us-ascii?Q?RNHcOUgcesuEami2dQo4BDNToz4LQpYgvqaDMptwGq7jnP9VG1upENz3aD4E?=
 =?us-ascii?Q?A8KspcoDs+SPfwECeOZ9J+YL6Z6CUKVJ93jFcSPnC0qzv8fEfKL0dXH6eaPl?=
 =?us-ascii?Q?mXH77NiJWOhY/qT4vydfoPu5RW+p3uUUJJgxUWSMUH9NlCjFpBxgvXJMY7xC?=
 =?us-ascii?Q?5DCLymgdkA4SK6wlGdOOb9vdkVFKH1tUMMtnz7nu8fv1UrpytggZ0BXIuZlB?=
 =?us-ascii?Q?hPVWFBRnpFjQHiU0plhlyEMCtNx4/hnW9G+I27VbnZGjhs+I70HNE1XIsxt2?=
 =?us-ascii?Q?7I6ewSOFvp6i3FEaFBEcSyS42wyPUeJQSgCz53bQ4h2yApkBFWlxmUCckIhT?=
 =?us-ascii?Q?xJbb9/LdmoReX6Bb9eYAjsdaCBinaACRFAqLk2GxYkFEC7aJgUR3suOH18PQ?=
 =?us-ascii?Q?6qpeGTGZR4fCQ9olcmuKktMKdlEIdA/wacPyDpYLM5lezK6JOJsd1UBPddrt?=
 =?us-ascii?Q?ZoG8VNyS0Dy/HdwuWRwD+/YVFP+eUnYxPJYsopAZcqGk1qxEbz4CscgJf6rX?=
 =?us-ascii?Q?z2LRFrmol50ffP/Cdz0KREEI6mu9jgSIjSbPmZcCFnnpgEEKMdom3alG8mup?=
 =?us-ascii?Q?FzpouEjrCvAf/FC2SHQSaP5YARjHbAFeplmZ2XXWz9/294mxFyDI/pz7/jCI?=
 =?us-ascii?Q?rF0uSed3I7g+LwvNJzoYjL9NJJT7UaF4jqcpNYQ3innxUai5kYFhhthWme/u?=
 =?us-ascii?Q?RgsAcvJI0YNx44tX75oF+oZsAc2eLBjlJE7DZxyFWVJ2HDWzq0xD/bFYyYVv?=
 =?us-ascii?Q?mvFYMm2uhvk2kSkNnSQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0llpPKh086gJBMCZ+kpi15Ne1qqdpIDRFwKyHjtk9shbJogHOxljS9TjEw0z?=
 =?us-ascii?Q?ia3dro7FUoWZzYN6gFWuSWMvPzLPy72VQ5GqdDoeLk1DKe2c5CabPwrfqwMS?=
 =?us-ascii?Q?M/JvoiOyJNmEGizHBvOMGwBVRHFWEjda9Q4MpZXhNUDU1NVdzZgVxJ+mJSEb?=
 =?us-ascii?Q?7AWOX84bLpcHMLR8a0XeLy/j1ydbxrieSghZL5DG2gfWvVeo6PHemKrt5cFF?=
 =?us-ascii?Q?0RYDSBQA+zPAl69JmWsUGdFtU0Bwsq2RdiB1yYcvQr56Cx2rmB4L9UQ1ALeP?=
 =?us-ascii?Q?s49NVp8GLjhFFETNsuMA8+2BRJybx8F6HJzxfEYLSgH9dmB57ix/8leqIK/w?=
 =?us-ascii?Q?WP4d4seOmvZrmRa/TVPAaOePKHeeOc3znYqetRaqNevjZVAg0mz/DuXjoam6?=
 =?us-ascii?Q?xZevRbNiddIEAaks/S+BjJ4+lr8n1PAt1fENuWT8fDRXmGNtEqjZOygfGMEs?=
 =?us-ascii?Q?QHOE3lXYFOWPfrvjGLtO8V4M8o706EpLj3wXpGb/TfHbGDmdxLtrwM0giq1R?=
 =?us-ascii?Q?MC05WeNtj4mw4dq5i+pIgmCBo7aOKHXbddqu7igDhrT5hla9IwFP/x0wgdPw?=
 =?us-ascii?Q?NM+E0KQXhfHY/2OJg3Le36oGOCCEtxYFwym5NxTaBiB5w0udo1cYMOYv81ba?=
 =?us-ascii?Q?3XXAIwibWylqRc9IJ+Mr+KVFFSE96gsMf/LCS0HR8XtN+qu8+D+mRKJxh30w?=
 =?us-ascii?Q?AsW67EKlUwT2suer5IeuyScGJAiSS/jmxqH1PhOl2dQiyUwsu9c/o9iJlWVv?=
 =?us-ascii?Q?7/d0b9Rpeyg9AdCBPWI+gE64ugNmTZnigdOM79AKBT8VpcAXYTB687acEyY0?=
 =?us-ascii?Q?MCHGRYYFMTYnwKaoByGa9kFFuQoBPeKlGHJ+/SlNR6/AB9ZT/4WmhjBBY+YX?=
 =?us-ascii?Q?2WoqtEcC41tOt2vdbKnDHxeWMHkLdIC/zUnpeSMqxfxJgyJPSGYDkKlrWoKp?=
 =?us-ascii?Q?9tADQ0ylf/UPy3yI9pMTMYoxyAwUt3m1ckBxpHcRop+Kd24thDNIoXH34L+v?=
 =?us-ascii?Q?HBnNPbEI/Aezill7uIIshLO44WfMocwf/NsoNNuK79J69kCGYygpctqDFR/6?=
 =?us-ascii?Q?H1h3+eR7IVJAeiuDjcrbgcNA8aiErAQqPzs1i6xIiC/djnfFhppTg5IeiRON?=
 =?us-ascii?Q?ikHx2+Jb8QGazzqEO0tPjSEtRiNSQ4sBnCI0aDNxBu7HBDV6zUu1zbmj8KO1?=
 =?us-ascii?Q?tJejFD0HxfFpw6sr3S9YGZVZQ8K/ieoV9cMRbursNPDeB/6o2PphRE2x0dUK?=
 =?us-ascii?Q?kNiHdkleKhcimRd9VGOUiOgymnNxrVX9VGCFBAaIFt9Mc/HG79gkjRQ4A+ci?=
 =?us-ascii?Q?Vmr/CjmoRpdR7RZBNsTg0JaBUwwv1dHrbyZaIWXMcfBs02bphyKy79qyGl05?=
 =?us-ascii?Q?st0jz3pyj60C5FTeYLN6eecZuWY7Acp5ZSxGdj/oInlMk6uXEtipcc+tKW0u?=
 =?us-ascii?Q?62mV7XIMxbfCp2xYARlYjHw9TAQvuM1+MxrF/1L3iIXO3bptyHX92FnMMkL5?=
 =?us-ascii?Q?MkG/QVfzEdRwF8WZx8tLJIoGsjNaSWXN7tdn42q+J6SgLVEL4Y49ywmo81uZ?=
 =?us-ascii?Q?aIBmDzRlWBl7jLmcg5iTDyAd8ilPPfsh8oCN0h6NfK1wjWUG3o8VlCqgoXfH?=
 =?us-ascii?Q?jQQ6Og+g38kMzHv7BhXQANIDfj34vhiUYPNqGVMu1nco4tnh7b+4PbgZCSVe?=
 =?us-ascii?Q?ADI+HtwXXdZiT3GXK74vp0GE8v8EuMSZMJTuRrKDb8xkfeBf6GTGSIYcA7+3?=
 =?us-ascii?Q?UUHpwyGhEg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fb383a-925f-4b98-64a7-08de6b5dd325
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 00:13:05.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkbItXl9hm6QYg20n9fNtdwO9tnKMkSXSwZv8vlxPi8S684qDCf+mC5ZqEQDJXdTDgd+NkEkZxhRirkX+1hXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3083

On 2026-02-12 16:02, Andreas Hindborg wrote:
> Add a method to return the underlying integer used for flags. This is
> useful when using the flags with C APIs.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I am not sure if we want to actually expose the underlying representation
for all flags. It should be something up to the caller of `impl_flags` to
decide.

Would it make sense to add visibility the wrapped raw type so that you
can do

impl_flags! {
    pub struct Foo(pub u32);
    ...
}

to make the inner accessible?

Best,
Gary

> ---
>  rust/kernel/impl_flags.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> index e2bd7639da12e..951598497de1d 100644
> --- a/rust/kernel/impl_flags.rs
> +++ b/rust/kernel/impl_flags.rs
> @@ -267,6 +267,12 @@ pub fn contains_any(self, flags: $flags) -> bool {
>              pub fn contains_all(self, flags: $flags) -> bool {
>                  (self.0 & flags.0) == flags.0
>              }
> +
> +            /// Return a copy of the inner representation of the flags.
> +            #[inline]
> +            pub fn into_inner(self) -> $ty {
> +                self.0
> +            }
>          }
>      };
>  }
> 
> ---
> base-commit: b8d687c7eeb52d0353ac27c4f71594a2e6aa365f
> change-id: 20260212-impl-flags-inner-c61974b27b18
> 
> Best regards,
