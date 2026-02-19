Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52933DEF2;
	Thu, 19 Feb 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511312; cv=fail; b=SzHz8G2SdBT2rSod3a5rRG+ImLGyLLRKPUfJ9QKRNtdWfJSwLc8YwY7a09KpMvRdRPcikKqf4EQzeIL6CKpl896MeyHJzGkwY2sfa2LVjQt4ihk3E22hHmq7oc2RmMXQam0v0FFEWvH++1OLz7ltiab8aR2Bqd43vkLKECl0OvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511312; c=relaxed/simple;
	bh=9IMWLZFnHJKHN7i+MDjBzOR+MlclZG+4xLJwzu+YsSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=tqLvCFCQj18PdL/NycJ7rlrGCMHfVRb6QLSURObva7pkgnnH00lI1A2v6qXwerMQ9H/8rInQE3IGLcA/hMXhJjmDInkLEVXYRpFEzHYkLsD/ImGq1JxzyIBmQdCKmhF4n4jS962eVWOpAxN59bqZ12zGhOWlPd3jc19YkYMD4Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pS1zMDi9; arc=fail smtp.client-ip=52.101.100.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pS1zMDi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biGq8Ei+Ln6kl8lmU6xqU8O7F4tsIpPKoqkPoe737o3tU9E4doZ7I6DYndN/yC3g2VhrCny5JA5QTdVNJHDW2PLQKPjgIehePUBRtrLDb/XYew5BECXqQ/QVf1/uyPYiXX0PEXmaE8bNsDvntA4j4CNy2QZroR+ZyWSb47dCmFamA4lZRTtQGHtfUs4jRq67DvXmj/g5JVBHfZ9noz3RXLDyPcvl+fUdZsLJztjn1jK11Ig0oL0VJTWyhQe6SCBykPP1gNbmHpXLYReKsQOmE+3oKEzRPlCvOti/HEKSiIryFADl4EohSLuXHyjbaARIrTWTdRy02TKqxGVHrOSZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohTxJX83AC7DuUdVUufP1FkYXCh2gM78R7f5rXDfsAo=;
 b=GHAB6tFdOQ+Pc+j20nPobgqeyMl4ytUoSIu/hyeY97HhDL+JihIaHeE2ZTVhQ+UPzLSq4qjCT6CLLZmjOdZyz0obMx/7XT+kmaEMRsEjWRfylJHvSSijsFAwt+YNZBgRlIlPSwGW5WR2DXBH30SwfAHUjI7RqGFm9iNvhRQLwXYqDjxF5NPRmuQq2rlT9oOU39nBKSJO93GWrCxe6HYk0kRk4TZqoFM70J50HvT0f5i7sxL7Trwp2cSWEBlNyMDTOOfVa+OCiUzJLuhKkXDArFACLbXMmUSmQUy387OGjlRQ9v6u79PHf0/fpApWEB174Lm9wF/HHgZMqTzzXV/pug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohTxJX83AC7DuUdVUufP1FkYXCh2gM78R7f5rXDfsAo=;
 b=pS1zMDi9KZcPDaj1y4q6lVleZrRD8w4t7iED0v49acoqEzuoJJ9eYpnZ5/SBk8RTCgGp38GrjfKqZZlZaNMiousJYYyjVlJ+Kd5TfgyzEviv5G1sHrlXCXYs4UU+hu3tM+p+Y+qY3eFTF9/mmmuIdALN+U2m61x6Pw9woh/VTVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB2666.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:28:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:28:27 +0000
Date: Thu, 19 Feb 2026 14:28:26 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas
 <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: task: implement == operator for Task
In-Reply-To: <20260219-close-fd-check-current-v1-2-fcab8d8469f5@google.com>
References: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
 <20260219-close-fd-check-current-v1-2-fcab8d8469f5@google.com>
Message-ID: <7b287fa96f6fde752067d44da2f1d99a@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::29) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB2666:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8935a3-5a25-405c-18d6-08de6fc3258f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UFAuo2tFBnBxWp8YQVIQ5goysnzjrLSuJr4J8A6unBTxR2j9gmLUMhzoLjyt?=
 =?us-ascii?Q?2632xRX8iq8bBO73MRjVkCnwcberXIYPYqGqp5eZBw2MCAYSHUHykfyA1FYJ?=
 =?us-ascii?Q?xmNnJRj+7fZYYRjRk+SDIEoxLTUe4PNrQK0/mKeOWpKo9iPJwKHjhPWZ3RoI?=
 =?us-ascii?Q?JUkLgF7moZjrPtXcrQheSBBd8ep2B7mh7wnS+aemBEmcGlHSQw/diz9AietW?=
 =?us-ascii?Q?91Mpl8Ak3FJvCJYhAM7kYl6nSe2cvpl8pK2kmW0VPUi/+xEZGGeZKVo5/RcF?=
 =?us-ascii?Q?pmkjamqGiq8uTI/9yykXkssi14NJrxpNqPTaetmw/5GaUH+AkKmdcFq7kKEm?=
 =?us-ascii?Q?YEl8LDpY2PPIYWROPrpWEHZZnkfvXg6hO0uT9wClBRZ6b5h/EgmVfDsHcsgy?=
 =?us-ascii?Q?eQGJleOeLHpwq3+qGKP6pF45zIZ4/L7zaKe/QKaJl1k8xuXgyQqU7lKxYu6B?=
 =?us-ascii?Q?wXJhvRd7eMP1X1DSZfOJJ8fHdn8qpdy5sI7UiIfIlUpWFmHO28CrRfKHlYCb?=
 =?us-ascii?Q?6OS2rcN2aGU/3XSwVjFUKWEN5w/LQZ8rRGq9n+R1cjYTfKuXrRQ8XjAroxJ3?=
 =?us-ascii?Q?iBUgiKrHndW+3wVqCuoWwBtI2CwtPGTXYOQqPVWXdA+WcaZPEcR3KT/GfL0r?=
 =?us-ascii?Q?wpqn3MaeUFRvjU8znAyBYCp7DJJIxyCVyNTOIHhtT2XQV9gDcE2NkZZZQspJ?=
 =?us-ascii?Q?zLUuppWMNQt0clLNJA9g77sgCuU6ri+gL01NJJge1Z1mQLNtvfDTpCXhikmA?=
 =?us-ascii?Q?x3Tp7zMDCN5PnGFq2k7q9Xa88epK0yyV9Q57RoRGmaPXjAFy7aRDYaloJxdH?=
 =?us-ascii?Q?a494xooaN4yqlZrFIK+ktuQDBJXKeo8og1MUxVrBXhKUVO2IJotnJMqW71jw?=
 =?us-ascii?Q?Q3nATxFNiTbhLiZqskhlwVjM+OFe3IV0NaxpnN0aUIK/LVZxrxaWLvudzR+O?=
 =?us-ascii?Q?HB0VPD5cZlnl/LuIhjbUGOuPADNV7Fa1hkXmijZrbJWFjatujMxzEKswicp5?=
 =?us-ascii?Q?LKQuRavUou+FVR2kg74LgIqsu/EJpKAiWAURetQ2C6OkDXnE+Elxvz8Xoiaq?=
 =?us-ascii?Q?zkNC/HRIRJ2V62wlsklxrvXkv2mkCIzitajXHqvVhQBytGDEx1xeNnjRaNr1?=
 =?us-ascii?Q?KKHimVnYPN4OdoYtB5416uEsE5B2BnRxXG1PGGAz0VLtIwBYOKjJFOmE48/u?=
 =?us-ascii?Q?IgPeZzO0Ygog1rQal5dyWAGH7r9wKpS1yZBdmVg3dpnVFIzMkoAT4B7PN7Py?=
 =?us-ascii?Q?wa/YeY+RpPZ521pNhwA4qRb2gRH6yV1N/AY6yU2FQIIqapq3A13qvmgIYUMe?=
 =?us-ascii?Q?uKLIdFDPA6zdUABgd7I2vW5IOxLaojaBQT7SKtKNm4DXbRpXXn3/ePk50HJi?=
 =?us-ascii?Q?pUQWFmfzOZRnUB+Fy38BDUNRpgTJqJ5qWkLsI3icof9339hXAESYEYC+b+/z?=
 =?us-ascii?Q?lwyPsIpO8b7yrtElvY9GH2jyja44JGEPoT3KJKvyC3fK869dACMi+NLAUgu8?=
 =?us-ascii?Q?UJBn1EpRJ3t1ipF7d/ekcLNivjaerqUJzW9DuyHb8VlQMr51Brm2ei46n5kR?=
 =?us-ascii?Q?2RafEMlePwEbOmio3y4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5L0pn4npssdr0uLelKBA+pzXnLEToqSj/bGNeF4eCcsfgLZcUZc1GsCRCkTO?=
 =?us-ascii?Q?TMjZEZishyr0DKCIxuuT2r+OG8AjoxLP+ccFLqlxKcbUROTZjEmw5uGHuT6h?=
 =?us-ascii?Q?3340wvStjeDEHolJzlAA/j2sGcdSpkIB0FnGjDWlPdMg3dcAiI/mthFMbB6C?=
 =?us-ascii?Q?8HD75pmio0dIsRqs2XLC1BErx91ekPcgod3LNJv9J24wfEjBX6wgBTvnLkKq?=
 =?us-ascii?Q?X/Td1G8KtUv0rxIr4lTeFADN2UrWicu25/Xj9VPcnilrKkL8PiHDhfwCeYkv?=
 =?us-ascii?Q?xZCny4WFqHnAxNxt2mAKVPTvcasstLcdcpqB0td4kX44Sswxy0N2b2wyI1Y9?=
 =?us-ascii?Q?DzxDx2yURDkAujYzN5Vy5aJrhxiIumZOrCei+1+DtcZavRKdicPWKNmCVBt/?=
 =?us-ascii?Q?Cy9C0OTQbI42Mo83d1nkuoAwkHfgTRQP2lAkkf4QJVjfuWnd1YoRCg74A1tR?=
 =?us-ascii?Q?HcW7E9ckmgRQHam+nSpdaHJAB+1qHCAGf32hTf9U1EotMAQgRVr26TeeM1fn?=
 =?us-ascii?Q?T9RewrEHao1z7WaL/5e09K7zx+ftpalQFeMIhF2kM4VgMF9hcuh+z5WbylWZ?=
 =?us-ascii?Q?2NDQ2h86ij5y1CtatYO+d/mOLa+gvpVFikrX6N1dscoaGI23A9E0LoDz1UZA?=
 =?us-ascii?Q?68mgXPdKKDl15WUnjXmqBXxcMEtXmQYyFGxS+HOh4/VqHIejASUNvI9aMqW9?=
 =?us-ascii?Q?gHxy4SDCuz4ls/ibNOW5gyBLqRKixuRZNyQ0gBaReRcmhb3oEBk4ZRu7KXz7?=
 =?us-ascii?Q?qc9k7dZTYPj505XGOvD+h7ga2MYnIiM6c87Zo4Wn6An+aHOVmh3JTc0uSKQP?=
 =?us-ascii?Q?dF+8qcJbSL0HEZqTFKSZTOALqTKusrVxuOw6hcGVsRrRX+XozGkV6RK0RGcV?=
 =?us-ascii?Q?UYwAC/bvj0o9HdCfdKBcmksJ/FlgbSzds4qNj19hIuUSqoE1e+poF1Q93oEz?=
 =?us-ascii?Q?RI2DFq8Tu99x84wYIf2vNle4Lv1l0Q3o4wRqd4VuKjFwlzjFy0ZQXNoU//JK?=
 =?us-ascii?Q?t7TL4a4q5giRLibqnsJLEw4Kb36uIC8vSAO+Im1+iUXvqhNiTpCUXdqHO9WG?=
 =?us-ascii?Q?Yi1qLdtmoYpzgo1ZGSm585oa3H6Sr5rRHWgyoRQUmW4mPsJ81n5nas0xamTs?=
 =?us-ascii?Q?YeIl1vlH3l0SJVKs1mgVDAZs/51BqT2COVjk1BPAjk5UuFxnzHZgY9EtQVuq?=
 =?us-ascii?Q?L3hAbzR8jT7yriiOudw+23jjIK6VLesNltmk5T9mZTbIXDX2X6ScbdqO+CDQ?=
 =?us-ascii?Q?LrInft2dbcR2AU6GU/nTbseyya0X4Qyu/ClutQR7W3enc6z6666n8xGN7Jm3?=
 =?us-ascii?Q?DziHGhTkJAMld7qcEfJUmAyXd/kWEmm0lnKwRhLTI4bdG1yW9da/Wep8KGBC?=
 =?us-ascii?Q?7GzGF3y5IiUD783KQm7l3I6DpEqzDpaxRJMz9d09v76Lqx0x8UR04rtpmmi6?=
 =?us-ascii?Q?dDNbMffy03sKdiVMl7qmSaYyMUtoF63W379NEAUU9ZyFxFNSYdUKcOmhOgn2?=
 =?us-ascii?Q?SvW6L6VBKLzDQQh6kXJ+dTXsJ0o7iFc2PlbdtDO7PsGJYjWHUbr4TfgTDNzY?=
 =?us-ascii?Q?I+/mTwQczp/cAPdXrKlyD56/lvhnwlBCJm+IYp+MeqdmPECbpKwJNbLjxfkK?=
 =?us-ascii?Q?CuuDRvdx3Gyx0BqAo5M8TOmumntCdWKxJ9Onp85c+u9Ndk3tojKHGgXEcYcv?=
 =?us-ascii?Q?gNuNV4wiL4Ot9JyuiT43eKTw93Ejd3JCtcXKVbzv796pH0i5WDs0q8pqpmtE?=
 =?us-ascii?Q?G3VRB3Gujw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8935a3-5a25-405c-18d6-08de6fc3258f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:28:27.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzP9ICEXlxM5DCxkLuqBp7GpFpmKTSCpRZf0SBMY/qSNn7lBC+obPJT6da4oZCvca473NVG+MOS+IUvlp2AuLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2666

On 2026-02-19 13:52, Alice Ryhl wrote:
> It's useful to compare if two tasks are the same task or not. Rust
> Binder wants this to check if a certain task is equal to the group
> leader of current.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/task.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 
> cc907fb531bceea6e8dc1175d9350bd24780a3d5..8834bf25cce5e7b7f48cd649c977eb92fbfb61e9 
> 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -362,6 +362,14 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>      }
>  }
> 
> +impl PartialEq for Task {

Missing `#[inline]`. With this fixed:

Reviewed-by: Gary Guo <gary@garyguo.net>

> +    fn eq(&self, other: &Self) -> bool {
> +        ptr::eq(self.as_ptr(), other.as_ptr())
> +    }
> +}
> +
> +impl Eq for Task {}
> +
>  impl Kuid {
>      /// Get the current euid.
>      #[inline]
