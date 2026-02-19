Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022082.outbound.protection.outlook.com [52.101.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233693271F0;
	Thu, 19 Feb 2026 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511263; cv=fail; b=ZIWb7hL56ndE9olNu7M0NuTwaLpQllxDsFO2bYrF9NXb0I38/rkbd4CdTJPKi9P6sgWg5X0tTEybKl7tL1AKrSZ5Pu0nQIWt/pfClYvguGhyTmxi5mxq0pa8KR5eILdzM24OlsUjrO92DZQEaVFZiS8eZzl7h88HHd37+qc3kCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511263; c=relaxed/simple;
	bh=+qT9uKer0ury66dUsM9PWoqoC2F8pwNWztJMVS/eLHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=sNVTR/ncY2xS1Cb0cET9rd05LQMdv9J0YtSNfAHwWDXlivOXCeUgW96SQVLZCMTDZlJlRn2ziME+Pe79T/N7QEz8ulZKnj4RsyL39cDACfsbIjtWCXczzMsSfb6mbxi3f16XEmyHra5mcf+wSwOhZZGz7KohK2lj4hPBZfxKBY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xiT5M4hl; arc=fail smtp.client-ip=52.101.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xiT5M4hl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDkEV3NLH69avsUeUuAR6dDthyqKBgoFmLVdae/dfijpl62ciSEEmD9lR6v7/55JhQfC2kPOeHTiZUmmtuZdpaRUyjsjTfHLx1VBqLG6hSq6G6A/r2wBYbngh0dZk15YwKE9kVcxSqIW090iYMPow+OuKbYEPDFU4+v4tUizTLkB7n0LE+/hKVSVk0BOEDNLqxuWOPU/CVaWUNnyCnWyEmxPsI8dndChRUD4l6xciWixhgsA2vyxojy9oMeL95a9Ri1YJQPf2aX4KGL/mB6QTZwSolXKlWu0vTW8I2Xom4a5EMCuVq+XJZn1UzVPxZyb+52uUWAKcnbUlUblDC5JwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD1DPHXAz4O9pZwQSZFfZdqozD6aMVe6sMtDNg0tdQk=;
 b=M7uzas+lg6zxVv1EcEo87883T6SjFo7AveWD7S3ziHskS+Fnu16idA99l9h9zR5yINimkMLKcBg+S4O5Ypqjy8gZbZL+JXIGc6QClpkpF2SW/Co0Cv2NNlNTwppsIzitilKa5uZ/yLB4SmX622x4f0jjHJXhwD9rkuGGB9RJ5yS8A6mbX3PB6hw7GY4b9VSb908HJ4s6ZylDdg8QBW5jLoboaFWlHoj9U/H76xQOgWYsIXb02H2Y7dRHkBPUJcS0uHzS21InZoQzgFDrNWKUpeaWolJuB6mRLbGBumGRDcVUtPPTQfK7KmohRLntUBFcRib3T2jLx5Azo7Z27yMygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD1DPHXAz4O9pZwQSZFfZdqozD6aMVe6sMtDNg0tdQk=;
 b=xiT5M4hlwqKbLrM4CDb6MuAppZvqn/4WqEYjQoCntbv93uQXprKb6u9m4tBfJnM1oJMHvhPQ2xtxvhdriO6h59k0tFCCw/EGrk/mo7OB+OB5a7r3zJJQXhbH5ZvV7SBdb1/GMP5gdURekjsNTdhxo7scJuCgewd1NHP7xmyUj08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3498.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 14:27:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:27:38 +0000
Date: Thu, 19 Feb 2026 14:27:38 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas
 <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: sync: implement == operator for ARef
In-Reply-To: <20260219-close-fd-check-current-v1-1-fcab8d8469f5@google.com>
References: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
 <20260219-close-fd-check-current-v1-1-fcab8d8469f5@google.com>
Message-ID: <0655a26e89c960d73888dcfed70645ec@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3498:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf35858-f9aa-4832-f5fd-08de6fc30894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FlWsUUXw0iXEcXKZFxt9zxcg07aAy/nflLtRqcihVEvXxXUk9Z5xu63GiRjW?=
 =?us-ascii?Q?2X4fCjW5AwOBK8q3nVm4vFx15E+scNNuGy+2JgOl2tZnVe5aKOXwKzPR3LvM?=
 =?us-ascii?Q?yiIB8DhWtnq/hm960hAYdKaJQ2MsBA96RzYsKy+7531zd5yeyAn7V4nX1wJV?=
 =?us-ascii?Q?DNActJUMby7jzsao5XBkCHVvfe86OG/jgQgc1TjKkPPGcwjJX1yMjtALECes?=
 =?us-ascii?Q?RJ2H4JJw1wVSg/w7i8kHce70VGi1oKls/uJvH90rLYWAY5/2bKHX0mjXbiC1?=
 =?us-ascii?Q?KPsWuSjG1ApguFYohgGlUYbSOOCpNCJY2PV+6yUw2dbhIU7np4nJU8HyOrE9?=
 =?us-ascii?Q?AWKIpmmwAfJxB/i/KLBa5mFYCcNrq+G1qcZrfCuH/pRNTUz6GXBVEhfk1q35?=
 =?us-ascii?Q?82SxG0Z5a1H8C37OhWAv94/3ldhxyrk3q5lKav6U2sTXuoARQX0OA5g7pQ4y?=
 =?us-ascii?Q?0OxtheRBCDF29fvQ6xhed0X0FW+dwosdgabmCMCC2JuVJ3WdweHNjaOv6gN/?=
 =?us-ascii?Q?Y01Zx9bnqiNhilJZVCMlr7GNnv7vgwSOP0uJSS5u0w8/qL8+vZQNxi81V7eW?=
 =?us-ascii?Q?tJIP7Prn/Wv0nypIuiUtNpTFuK/Zy3TnjSv4TU0wW/J5ogdoviGv9kUtTdVA?=
 =?us-ascii?Q?6PSmU1UHyqOPXf+TBfHrt1C3Ur/SlvRRddd+bjKkCYgSL/tFV7pzZDSkR0HC?=
 =?us-ascii?Q?OG3DEUJxbSq48+EFL/uIZasNkrl2K6b8SoB2JYgdWZ/s16Trye6fm2E23AOE?=
 =?us-ascii?Q?T+B274jq82zP2TQpHtbQwKxWJVUHMvAfcqd7ZbaClP7Xu5REY+Sh68yFWTK0?=
 =?us-ascii?Q?0Z8tmDr7811ELmkDmMHZ98u+o8r7XIHgJN+zg72szbSfL73xjxXAXHZJnptC?=
 =?us-ascii?Q?YebRS27NQ7/Ckb9MQog+mrbf1/tL8b7RHeG2etNrEXnrKNpI9bJ2LEMZyT2h?=
 =?us-ascii?Q?p//FRDykhMUKiELgnQ4hheckfOis/tEX3WEZbO/C7rKafjhWvmCQ62idS+sy?=
 =?us-ascii?Q?zYdZM4h4d56apBM+Xa2fX3VPhKWsJby5qJrOlLL2UX9G0+T5/0RWvFKbc2y5?=
 =?us-ascii?Q?BgLFvOXYuYC7sLR4YaVlIbw6d3ibzQB5rjTs0WDth94wYx19Ebmw1u2p+t45?=
 =?us-ascii?Q?IIUNc5UB34yU9Q1sls1yLnm8lj74mfJcU1xLA4vWMODB8oXWvm8TaBbC4luQ?=
 =?us-ascii?Q?pVcY2N+5I7sDcTdcYd7BdF2mqmI5xIheoSuszMfxNyRpAgVFJYIEiwTWtEWw?=
 =?us-ascii?Q?HLyZOEBPsoMfM1ZHWMqMyy7lsctS3xxNID6T2KFBdX0iJlYCQqdF7z/Nz3zb?=
 =?us-ascii?Q?At7gyvM5w2sWn5L7mcAErG2XiZUHj6avQKGQ3Qx3yW6eTkVYIZFCT7UdgPXB?=
 =?us-ascii?Q?t+FJq4mwypisHPAfWABjQjKbQqKsP/ndfmFi4Xkr86j7vd2w8NTeRrBJ3ZIS?=
 =?us-ascii?Q?NV9ZiUvQxdGGBZuwAtCM094Fa75SRpMcGEwZPzLpMbpIeAtKtrH6bu81vmYM?=
 =?us-ascii?Q?9e798MVhZFVCNgfTsTIrfBbvrgysVlkJ21yjcvALfD3vuU7umi9KlzSNMSvv?=
 =?us-ascii?Q?qxAuWBpWg0AjItqxdNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bk4KwbWllXXhUH3eS2KEo38Kc/xNMhuk1dh+Bj9we5ni2KyV0iqmPCLBrcUO?=
 =?us-ascii?Q?TtgOnypukSONw1T1uRE8QhtmtAbbbe2fXod2iMO15Ta2hUx9eJOl5il9fn1H?=
 =?us-ascii?Q?qja6fMy2xDykRlIHHU0wm2esfou2wyBz6WP+4Oj1pcFuz84Qkoy+5yocv4OJ?=
 =?us-ascii?Q?XIvF137a1duX36kMA68AnOzUP+AQAL8B1+R/YV55ZSdnhesClCToyUti2PR2?=
 =?us-ascii?Q?7SFkHqZxBjJHEbgGsUckwHAq2YdjD9hrvacRxxiMJoKBfH1CzWh16873g7OP?=
 =?us-ascii?Q?igbFRsCE2LJruLyU18jH2tEL4wzUnyEMOWBfeVlj8jPANJ/+9IWz32sJloeX?=
 =?us-ascii?Q?qTUCnF1Po1RrDTjTrzGTYSfgc94skwjeUJRnRpN2EBzvh7VeUdlQO46wp6rS?=
 =?us-ascii?Q?oMgRpImlPDvrE3aRVFTeFo39OkEH7VohSWDJTG37VNhwxIcIK1IqMMnMJ3Nw?=
 =?us-ascii?Q?cW1Uagy3Q8JudWb+w4xHABNwnC02zdee4qWfEs43Z/DKDkq8JHc+YF/bSjy5?=
 =?us-ascii?Q?dW9V78+puIJT1iBEtX5tclWHshVhwiSbiG0Lzn/akBZFh7S+MBhRZV2s7NTQ?=
 =?us-ascii?Q?7M1g2bTCPzrrzJe1AoPyVDoPpj/yLxOzcVjxtAsu1vLn0J2mSt3g6reSGX7y?=
 =?us-ascii?Q?a8v1XpwPDfhsz8FB1EYbMBJNL6GDpAcjHuoGna3dvx431hD6W5aoT2g0kwC9?=
 =?us-ascii?Q?46b6thPFJNWnCXVH263DX76J58FqIs8fd03qg20L3C3sAzY8lUSFwMn8vdZC?=
 =?us-ascii?Q?SdKot6s+LjCxkAUZAOOIoMoK53XBGgLs2LjgDGW5JvNV9bZwgO22DKrBaTTF?=
 =?us-ascii?Q?xp91L7sFFd0itsmDR89TznJkKImmxOb+sqizLYuyxTn1dhJaRu3+ZJNVS3QT?=
 =?us-ascii?Q?bj6Dy4axTOMC44nmUa7Xu1Zon04tudWcnK6JpFDulNFwJncBQphHleknnh3l?=
 =?us-ascii?Q?F3KAshjIZzwXoA/IujHMBtG1uQ2WIUWsAlRSq7Wg5jt+0XinUtJyqYHCCU+f?=
 =?us-ascii?Q?Jqdx9qe5YawJqNBORIZE4sKBrQE8kyvUgGOdEWcdFvLX5TLbDvUcEp4NvrV1?=
 =?us-ascii?Q?Tu+65RirHSByWyGXFVb59F+puK/TXcA/oITevkRMuyxpefN1Fg3Cmz3g0EUy?=
 =?us-ascii?Q?M3hDrW1lNWZDuTrhfyMFkwQXHgUJsB3Sa2W1xGKAIyLiesks950TK84EeFTM?=
 =?us-ascii?Q?shEHBDlnGzWa22Lp+sDutE1jMnUswxnEBt/ZoT1jwaxIGoz68eaKuo3t9LQ8?=
 =?us-ascii?Q?AwmiyV3GKRZnZCeXYwv0lzqECxyFln0oWEvUR+ENg7UPaevx9t+lCYJZvsx3?=
 =?us-ascii?Q?7YYcpvLjSlO+TY/u7hMIU3dioL3mOtl8w1EDoibPVcPDwbTHBtJL1do/vEtH?=
 =?us-ascii?Q?akTbNYD7jGHkWRv+uTPn1uwaMjSVsnETWeYq+OPpEs8NvON+f9ZC/RL0kBUn?=
 =?us-ascii?Q?tYe8m+jXevXD8kkre26Tz3s5SeJ0FrLg6T+5VqGGvGeBTOfJvfrfh8b09cbZ?=
 =?us-ascii?Q?KPmn4yikuIaCnK3SV7aDkl1lzIx+eq3INLssL0PSdfteCQQRE5SHatDSGx3p?=
 =?us-ascii?Q?OgPWkcNccHVB5bu9r3QEOe0se8jK3D1PpEHODIGuVAjbobAMI/55G9F/OTsF?=
 =?us-ascii?Q?DDzFbezP1LFrJg+CRr0Pa18/op+yfsxwyRUY8ym1UG9ANBWA3Cd0F38fVXB7?=
 =?us-ascii?Q?XwPnJAdFCEnikEy2qpBhUNdSVoPheOPwmDfM3vImv5MHjVFSDcVxyMCKNUQZ?=
 =?us-ascii?Q?BwBIYOjcpQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf35858-f9aa-4832-f5fd-08de6fc30894
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:27:38.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr2g6tCbkn0UqN4PHXoPUpWyEj1NzOZLUZ6E2OkPN0hWkMPEGgI4XXnVjRyetkfBVcTm9/Bn/8FJpQSh6OlbIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3498

On 2026-02-19 13:52, Alice Ryhl wrote:
> Rust Binder wants to perform a comparison between ARef<Task> and &Task,
> so define the == operator for ARef<_> when compared with another 
> ARef<_>
> or just a reference. The operator is implemented in terms of the same
> operator applied to the inner type.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I suppose `PartialEq<U>` cannot be implemented due to trait coherence 
issue?

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync/aref.rs | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index 
> 0616c0353c2b3b4d8b3be6c4b8156995a2f1d504..f56598a847e949b497f4cf2a05a7298a58a0ccef 
> 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -170,3 +170,26 @@ fn drop(&mut self) {
>          unsafe { T::dec_ref(self.ptr) };
>      }
>  }
> +
> +impl<T, U> PartialEq<ARef<U>> for ARef<T>
> +where
> +    T: AlwaysRefCounted + PartialEq<U>,
> +    U: AlwaysRefCounted,
> +{
> +    #[inline]
> +    fn eq(&self, other: &ARef<U>) -> bool {
> +        T::eq(&**self, &**other)
> +    }
> +}
> +
> +impl<T, U> PartialEq<&'_ U> for ARef<T>
> +where
> +    T: AlwaysRefCounted + PartialEq<U>,
> +{
> +    #[inline]
> +    fn eq(&self, other: &&U) -> bool {
> +        T::eq(&**self, other)
> +    }
> +}
> +
> +impl<T: AlwaysRefCounted + Eq> Eq for ARef<T> {}
