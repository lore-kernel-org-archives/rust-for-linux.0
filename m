Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020094.outbound.protection.outlook.com [52.101.196.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23ED548EE;
	Mon, 16 Feb 2026 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771205926; cv=fail; b=pIWj/Bty7+KhAgNQjRM/n78tT8k/UvJzmM1wYiXj2tEZAhbo3ax2nIroOz9YYbrmNgtIuEP5lY3gxL5LTnd+j2HFXypcivYER+YMiwlZibmsLjZzQMXZZcaTPTDDxMEotVYZgxzFp79yrc9GtIRnExbPep/EDcpgrLiO4AlaMAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771205926; c=relaxed/simple;
	bh=s5fjQqnVBw8CS0bU151BlYvSJgxRJDWVrR1hO1P9qCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=mnPmxosDudoL4gPv4gzsCPUhw7M6Vx08HOU8j9xSJtp2bK9YpF69P7eHAQpGdYPWfPi+FNpQPDLErJa9P4jextxBqE+qQ/Rv9sDpPADTIJLFPtDfY64z4DNje3Rbx77zaG/K7mD2z9sZ/vfLsmfA80XZpLluQIb/9dW8/8ceVH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YguGVfUu; arc=fail smtp.client-ip=52.101.196.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YguGVfUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilOik+N/avqCJRdBPH9vpXzay4euSlaY41kP45CXNyhYWy1e45BM+Hak55xqaa2aS/HL57eswoMdMKvXZ6qMeTAPYWowsDV1mvu1q+DljvDkpW/oxhHfyb2Kf1Ibzd+J5e6vQ+Or6kWrjiZ8N4XCZEOlP7Xt0MLlpMj52fddl8s9S8CDvfr5pwIlHnEi8zkdieURRH8qEyNUDxrXc9vYpKZRRofabQ4eWyjTaeVo5QscFk4ACepew3FKeM2x7Wp5IxDl3XtGU/ZDXm8OQf3o1JsPXXlcxcjKYmaChbysnBJX2g2O+ushvq5PCaTkEluiW18haNYs971g6DuviEVgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jzjvqmKNeunauUDfCnKiipdlSbZ4CGl94wGaVZgxEI=;
 b=Fm1J2+ygsgr1NY81bYnKagcKBvVj6bObctFTAAp3PBwWr7p+eK9Znfk+jFHxhOLXYVC00piUgUlv2Kh/rXWghRAA3fWEveqk0iSyi51fHeB4hiNliY9KEuvJone3EQppVjGeBo44TBOdJX8q5LSmOdATf67oueIBB8jmtgSF8T/e/W840HhmHNlbm8iSpYX+cZwYMZO6ftYzUTrQ5R/sgAIYJgxEikoY51iyCJJXuJAU4Lv1AKSLwpP+aRNfMcM8YCGcv5+mbZ6+0tgCDTxE1FYDBVpJ7eUHzcGyEbNknmgIqi4T7wqLeQnc/iuv5/SVzk6BQAs4cMh74rcmGDUvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jzjvqmKNeunauUDfCnKiipdlSbZ4CGl94wGaVZgxEI=;
 b=YguGVfUuo5wgxXiLjD3AFDf6f0sDvgq9EqMpQevfI4QrlumX1m1G0OtrUI+pRJdXpg22qkuhRLMWH7/2d4Lfn77ujN8BQWpU7NNK0Ip+Q9D5BxrkizknuNl8LzE/X5lFYh7Y0QD0uY5g/IT/s+tp92WPPjtGZZUn1bhsYMl0qP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6528.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 01:38:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 01:38:42 +0000
Date: Mon, 16 Feb 2026 01:38:41 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add `UniqueArc::as_ptr`
In-Reply-To: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>
References: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>
Message-ID: <6b03d16701160d313c08c9cb12550652@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 03877c28-fc24-4f65-5569-08de6cfc1dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOQsHzAmuzPgYthDcXJtLSTPzWvV9kZTQc12KNssTFdJ+yxbU7/p7iH+zI8i?=
 =?us-ascii?Q?xqFefU3MS2JmMinQAEGEaZ9sxkpyN6cnQXFBwnARJWb4c2X85upbpN+83vbF?=
 =?us-ascii?Q?6gC0cIaRPk3pwF4MCxwoUn9EH3+ScJQ53v+XC8T6f922GCiWcDeG7sFd5cAi?=
 =?us-ascii?Q?UX25laF2m4CymR8DRSXbikZ4lnTlgoaM1BrsoEwP1hEgVbyhFRdr5fFyDRjD?=
 =?us-ascii?Q?sbmC+g/XzFdcfKvp5AN5bzO2d0pZyJzkIGZeW/Rk5v2GeQiRGKVay+t/+XyM?=
 =?us-ascii?Q?8z2N5XRBipZMwx/+YEVIn5ZKcyg63lXg553u1jxd9i7jNrsYMuLGDYOamv2H?=
 =?us-ascii?Q?c1HrrtACPmEbb3Aa2ZVUjEFLT2WEOgLlw9T0Z9vGkEsmKyiBa9+lW186U4G+?=
 =?us-ascii?Q?XBBx1V0SQ0jaFyhWaPt38sDr883p+20NsGFzqaM9ZJPbH1QrnxYp9STgifP8?=
 =?us-ascii?Q?yK+v5cqN2bCtR4cgNOjFnG/S5a0fAYJ1Prq/wgtkqUjd1zGtZt+vkQSdewbB?=
 =?us-ascii?Q?C6qF6vpBCXicG46YVuvDzGV6h9dJyC9XrOcN7sw0NzRqJSPnl1mGwZ6nq6OC?=
 =?us-ascii?Q?6/YZX7o6GYCMN8uXKp1amI26G3M1pc5E/H241LUzmYAJqStXnbep2S/Bllyp?=
 =?us-ascii?Q?EihCfDdp4Y93xadSaY1dcAOF0TCeF2331xxtIIaeUH7TrEyezHtymhZe0CXo?=
 =?us-ascii?Q?2zPJPIcb/d9l+8Ngzmtf5pqV9JFqEYbgettf12NFlwebCSH3rcxy8WlDLalS?=
 =?us-ascii?Q?FjZqzewPILAqDkr26VdoZsODTUza8yaCQcX0rhh59sfIeNjghRdLggi9S73A?=
 =?us-ascii?Q?in5zy7lQbmMn4w98AGyQ3Xm13CisHwY4SC1MFXJJn2VhphwKaApNG1Ibzm4Q?=
 =?us-ascii?Q?EffpJ5w8wk+qibr9F2aaVQczDnkjg0XVxmelg+DQpFnVdnD2xlamrbMM09/h?=
 =?us-ascii?Q?mUIlIXxsfG8H4oQp7E28zZ4J7JjeBX6Tpu5g+7sUwK9iOGqJ0M3UnkdW+usv?=
 =?us-ascii?Q?yfPcpZfvsmqdPTIFV7qH1ZcRa/8M35GXKZSFs5UrwdQnEGJF4iPMTpbXfqRE?=
 =?us-ascii?Q?idwlFj1imMxMwIExQuJ8LfxCgp/sfyoid87YpqxLg/ICdiwBZHgePLTG+h3P?=
 =?us-ascii?Q?eSZAIYToGPJJibuf64ZfCkEGWJYii2vlD/suOpKtYGEZ4hKTgpK4CD1FORZE?=
 =?us-ascii?Q?cvaMQ7s4RUq21Hj449RkH3bixUnyd/w9TPc1jMP9MRGIGZI63bTHsqaQB+L+?=
 =?us-ascii?Q?o/BBfIyVQ73KhtZK3EIWs990x0t6+d1bzLqFVHA1kw++TXD4WEJyLDO3PZCN?=
 =?us-ascii?Q?WNZ3MLIwByM6HKc27Q6Q06vz3isSI6uQmnkYepFNvzhMsue32HVfTOvQ2y+V?=
 =?us-ascii?Q?D4h9zNk56OewGof7EWdylgvD19+vKhzdUnUyELfC0RBt0dgX1IJeGSSHVJPK?=
 =?us-ascii?Q?fze9mfP5Nbgw5nBY87QTPGUJv0MV006nG5yh6lEHqLDisnBCLLOKhWlIhIgp?=
 =?us-ascii?Q?IXmARasEKCfvg8igUCnIpHkqcxdukTibNeZgJbKEn+GP2OYeBMLOqKCgR4Nj?=
 =?us-ascii?Q?4+WpBYEiBVzLiuz+wTA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bbvn4JGDJH6cbz/z1arGU+eIBeoccVIUZVbyRQ2ILiOPN43AsK05ZVfkaeN+?=
 =?us-ascii?Q?omYHSeLd59YE2Vb6QtpAx3fMIenWhB3E4e1DAMoyfs7tFXE3K2vrVx1lfv0I?=
 =?us-ascii?Q?haH+CYWXGaT+rq1L8/0MiINWHKdYCd0BSADpBo6GUEdSNOjBEfAqpLnGXCri?=
 =?us-ascii?Q?1tLlX7FpMwavPoTOLykbeJpyvoSn6AneL6dF0Zc2wJUkwUMs6dnidgJJbo/t?=
 =?us-ascii?Q?qH0OnHF408zw0tubONKXwInOEq4EGn2UQfVYRQuiK7IPwukmX7HNO/29rbm6?=
 =?us-ascii?Q?rT7G+f029hxFDnfbvP1HX9x40DG9J27jIOLIEhZ4iQhB7tsRQRNhNiBknJoJ?=
 =?us-ascii?Q?ncvlsJRKHmMbT3uq3c2RkJjxqQuE9diiniZZlPXP65KX6N00oRlsOFkOWQvp?=
 =?us-ascii?Q?4XHM5dthp8Dw/bk3qO4/Jy46uVHEvLxtOP5HkG+OshlXDzR7NOmxrzpaFVD9?=
 =?us-ascii?Q?Qjusc92RoNs4apN8qxd2oLsoL41wcApL8Mx6hc1WlNYy+U9kJIWvR68YUejc?=
 =?us-ascii?Q?nuvOkTtnnc9dDcOBPNNmRwsD3niIx8HYHn26RIhNiCl15SkBFvd/jXDV6Sll?=
 =?us-ascii?Q?bPwh4ZKyXgKd1VrkhPCZTf4UjTAs3P6c9XjaAyNJfXEp2OygIh1w9I/XiW4o?=
 =?us-ascii?Q?o0HqezxQusGaLbneDrVV/grDtXL0qCP9A/9wVZ+ZKyOEEn4V4CJSkhBu0F96?=
 =?us-ascii?Q?/VYmCu2WxSWuwo5Rmz/5EcNCD2OgTl/fyM3Zp0IaUMiu8vxy52qg4NvMqe3e?=
 =?us-ascii?Q?LNnphAFfEUZOwPbdHHcGpJ93upJ2U+4GTARqP9jeEb9tifMFOgExUJOLQg4n?=
 =?us-ascii?Q?ePHT6KD07vbiB3NOXDo0vd4HGKypVXCaWJLx7//PHRtX2mtdLBBqslfKG/Gb?=
 =?us-ascii?Q?YT2dulxgG0A8IO46Th8GMxvQBA/PTl5h+3sjxJ0gg50BUdoeeXp+U11+ZtXN?=
 =?us-ascii?Q?2Poq3LM1wbOOIMkhAEWYEnYFVvs29uf/QuYS/zA+2v6db9NWAb65jAAeXBPY?=
 =?us-ascii?Q?5TPyY0NB0b6MLWmQUVMOPNsRBtaJJTMfn5ae1kaKyVGQ3iZh2EGQ9qTy6G/G?=
 =?us-ascii?Q?5OV00e50yUgyxuht+3GHbQUKBo7iokTf9qdDBCANiB5FwEeOgp7g+FkLeBWX?=
 =?us-ascii?Q?WTNsqwXUwuW9kU4z03TquidxhrABw8xqmWlbL23heZd52gsNdfd6nitnIMMZ?=
 =?us-ascii?Q?WhTgFvTC4IAn+0a+SJajdhHk7Hjo6jIZawiD9GrCTPRfT8+lviobKh5lNfQn?=
 =?us-ascii?Q?eWrpzpOnPEuBnHoAHXBAZ/3bB8isQlXvbddQztLTM+aXVRPalrh342g7SrCG?=
 =?us-ascii?Q?xnsR4j9mu9ILpNtqy7vrC560J15SAveonr+O+Ov6yPnv/SBPhK+NgyAXk/PQ?=
 =?us-ascii?Q?kkEr+Bvz2Ji+RMkUO0Ya8Q3FMjt9P7PRBamUvjXjPhi5c9zOCfJ+E///uzpa?=
 =?us-ascii?Q?Gki+noYnhslATVTDeTlp/nXhnoqg6ttR2IZj8Em2/9WHzLVfMorRJukYBxZD?=
 =?us-ascii?Q?qCzdY1AsOEsM/itzaJ8vglJzx+Vfffsn6rfsIokZr6iyPIcu3egTxi3pAJrb?=
 =?us-ascii?Q?Pb1ENjU5lF93aVb4WZ1cb7mjUqQtRh8cLGOjuI4uckArTfCyZCYYBnQ2/IE6?=
 =?us-ascii?Q?VccwsxRmDrCaUE/JYUHy4MVYFVycwqFozjpmsGl829PMHZnT0yjG0N9kWOOQ?=
 =?us-ascii?Q?N9eThK+95D1QpVipPyqoxl4jQ7RNKxbl2B/FzoOQq3jie8b9lsizX4tqaljJ?=
 =?us-ascii?Q?X9WD1v0PGg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 03877c28-fc24-4f65-5569-08de6cfc1dad
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 01:38:41.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ksOmd9zwD52fXuC7++Jq31eCyt9xRbk4qvJAotLxRzXOBiuoZQY3npWCU2cOc2MYYDxWfJO/qtqc0pdnVYWmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6528

On 2026-02-15 20:38, Andreas Hindborg wrote:
> Add a method to `UniqueArc` for getting a raw pointer. The 
> implementation
> defers to the `Arc` implementation of the same method.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync/arc.rs | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 289f77abf415a..9c70fdd39bd2f 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -770,6 +770,11 @@ pub fn new_uninit(flags: Flags) -> 
> Result<UniqueArc<MaybeUninit<T>>, AllocError>
>              inner: unsafe { Arc::from_inner(KBox::leak(inner).into()) 
> },
>          })
>      }
> +
> +    /// Return a raw pointer to the data in this unique arc.

Please add an `#[inline]` here and make this function not a method.

Best,
Gary

> +    pub fn as_ptr(&self) -> *const T {
> +        Arc::as_ptr(&self.inner)
> +    }
>  }
> 
>  impl<T> UniqueArc<MaybeUninit<T>> {
> 
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-unique-arc-as-ptr-32eb209dde1b
> 
> Best regards,
