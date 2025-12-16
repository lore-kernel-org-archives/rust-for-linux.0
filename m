Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021121.outbound.protection.outlook.com [52.101.95.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B12397D03
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888346; cv=fail; b=XwuXhWPVzAAGnVLpK45EVEAFzw5hirWEl0N8We1mQHRd84vKF1Efrxm97qKKbZMZZLsW9CeZ6AlxzrkPgIX9137mc55igQEpd5IEB2ENH6TowxR7eBDunIsUuP7CeEx19Hbtay8u54Ff56QgExU+hJuxVbQhc7IH6Dk9e/qDkgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888346; c=relaxed/simple;
	bh=7ZcMrxBO7Dgw+pXLGPoRb4j4RF3UwepGMZ2bOf3rHbU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CGiHa6EjX3ZIMqxiPvnbFjagRvdqru8D47Ky52aRZgnEXm7LN+cq265gT6KV07W4EM8YMTyDDa2kAklD/hPeXYTvef//h2WdMqfsV47BIicQgW2qFwPmTxoadKChWB0TrHRer01qVXTanY8byZr/dopBnF4FU3rmnNzPVOsxu70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mi6X16VM; arc=fail smtp.client-ip=52.101.95.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mi6X16VM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6DmRgfdWcWm5ZCA48FNBRhXU24jZwxkYwWQ7cvSKVlT+6pD8ztw2nK0LKcIQfgmoaooXL2T32wXJ1RoSlYJUYg8BP2Ng0IbXIEvMn07pBNvSWfyvEXcHuhoLc0q7d/gVWIWhVFsmN+WcCMxWloiPimq+Pluz9VosLGV4CDxDz9ZNorpkF1GTVLdjhP0/k6TxvjDL0eGQVYYSQt94RS6tmUMAc0VcKXF1wiyCBZQbUbzjZrWQbdRktiVsfke5yrERGMyi0eEwT+xq5GA5sKY6BaScSYmkFgd+bfmI+AYTWODqR5DEmf3+CxD1l9UyK5HE/Ky/pTgcFxVwZD338R1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV8RsJCkex0tHy2xC4mkks5B0DnOsMztk9NPSg92soA=;
 b=POOmZBFoaAtVU+PS+cc2zYKkWH9+C8bxupuW1bEOQSHSbwiWWs7sGwXyKSta4Kaxtfs2KRdcq+tiMr5cyBKQ1QSmZKKqSl6NOQLS1111Hhaqbax8GFcaHq5LUWl6ie9VcCmZtjG1X+HKbCKmsqAbdfRImOl+N9XEghMAS+bwFJlFoVETwivxIv/PfwhwoWw5r9A+yf2zPqDIUCehu/BZl03pAVk3jSIFjRczlRJ0NSHGVResgkJRwRDtqxZ29Se/k8quBtIiYURaaFRSnS3B/kWVfwASBRLTOgsgNdSq73BmrJTzwjx379zs0tzYS0OGz0XZIPTUcc2m5IwBLV4qNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV8RsJCkex0tHy2xC4mkks5B0DnOsMztk9NPSg92soA=;
 b=mi6X16VM9e9A378m4V+DMV0vsQwTt0jEmwb3U0PP8LPTkGWSAo1Q4oXBcaFyd2F69hMTcS+KPbmhIhDfMQTh/14E57aFMBAf7A5Wsk9GfeqWMZUmE1o3R82SjMDiynd5PivZeMT5SWVfrswLHJfD85LB6z6ic5CzcTG6ZWXRuHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by LO2P265MB3277.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 12:32:19 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c17:159b:10ec:af4c]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c17:159b:10ec:af4c%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 12:32:19 +0000
Date: Tue, 16 Dec 2025 12:32:17 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: set_once: Implement Send and Sync
Message-ID: <20251216123217.1d1f9143.gary@garyguo.net>
In-Reply-To: <20251216000901.221375-1-fujita.tomonori@gmail.com>
References: <20251216000901.221375-1-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::36) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|LO2P265MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bcd744-36ab-44e9-66c1-08de3c9f275e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W75csgcekNIfI5lsJBezZUG77Ui27jXJQsinJY4HBS76FcKvrSU6RNVJ6+u5?=
 =?us-ascii?Q?kXvcXBFYKHfSs5PAvpN3DQ6YuZvgwzhxbwdT0gnrGnaq4qdlFG9EUadPfXhP?=
 =?us-ascii?Q?csPoGaqXy4UGsPUSasiM9hF/Cw1EFKRmVZmd3WQlznULjJ7jahLNVcxd0jYI?=
 =?us-ascii?Q?Lk+3IXYoAIpxHus01QYX9OLEcMhAQ6tf7cm57Av0QXDCo7q9F6ZpjWxAx1/C?=
 =?us-ascii?Q?VI9rTgLGjd6LeKXzdi+orD2VnFcAh/0r7LIx1dr+CPibA6cHaReh+Q6da5uq?=
 =?us-ascii?Q?R1mGdZZYnZuJ3USvJ76gYYTjfEi+VU/1TEyK6OcQqROKysKr7FUcyf3+XC0l?=
 =?us-ascii?Q?9zjv3ezqk2fbQE97OfnIMBFnHLbdM0q3QpXvYx6pOw85ie8umaTzX7FGmCIn?=
 =?us-ascii?Q?RhRtt5Cgch50LJt0EyeWxM6sc2dAoq+CSIZT8g5ib/97Re50At3uTyGR5axV?=
 =?us-ascii?Q?j/HAple/sucvHaWwuTRz00IlVrxSsvwpsjjTZG9usOt/aG0aSN4049pU8qQo?=
 =?us-ascii?Q?Dx9iCRZkodXODclo4pRzCrxE4TAiOYOZTIK2qQ07M1mTozP4fnrAYDPd6mB2?=
 =?us-ascii?Q?nnMLDDDPPikewMvms2BBVmxBdUySJx7GRcz6hxy9k7Cps6TT7XK4raJs/Vh5?=
 =?us-ascii?Q?3N34ah6fzM1wWVmDUiZqk/xilpGB6MmcRz2MLeqkIknkKmoSNi2kL4AFUn+B?=
 =?us-ascii?Q?1mfPJAvLA/Xtg4dL+Kquf/XYFL8jfX8IKBoZvaW+H1go2ZG70+G7TMCZseWo?=
 =?us-ascii?Q?itLMZTzWjeI9EP/+hwd7cLUJd+k3RH2pfqMYjVEikZ+60QRT8mXjLx2h3S6z?=
 =?us-ascii?Q?0M7eHiYKgx8r94da+XJcXCLTeodYWzhYcrCKFBIVvJWKmGHqdytoHTVW5KEC?=
 =?us-ascii?Q?hG4yWAHsfXJh2yBvXBbWcIAbJXiCpLP1eRriVDAxwHcaaR+yknzEZSqWV4SF?=
 =?us-ascii?Q?l8G4UHYsU4rUCRqsPgVPTdO8yhSoX4PbG5vdaUnd9oB7QOUir4SASf0Kv7Fz?=
 =?us-ascii?Q?r2/4EXkWZRwzZFOwRBRfDfSvSYqyeGsgBpNxXSzKginjp2pmQhVAul8Ke0Bk?=
 =?us-ascii?Q?JNMSS+VeDsVYFd6reCBLUiJ5dfOyD5/YMQm/Y/2EvN7pr/vuZ1qqc/Gkqvih?=
 =?us-ascii?Q?VrBsTnSahlaEfndZ6XMeaJH4uViCkgRji0ApbEWN1jQlsj/NResI2Qk8we4K?=
 =?us-ascii?Q?zySSKYTVXB324fbDzqDr9r5/+swFfEQTA9wixki96cRg6IwaeyHgqhWGx9oJ?=
 =?us-ascii?Q?M4FHVTOWJ9JHgr0Yk6KvlPqHF/CHp32ukn72zILlyGDY3WRierFk0dqL0D1A?=
 =?us-ascii?Q?kqtXUrBKgkKJiciHwJRWRWulO4UIw+1nwBt+yKRxKlYZ9WXdofls7bmaMob8?=
 =?us-ascii?Q?ea4r2NEljrqu+8t0Gpyf4EqZB7D/aGfywkk2e2zHP37Pq3dYOpdyxnFnL8Az?=
 =?us-ascii?Q?A1k/g+BLBiI3wvK7VE6q47jFQPVNrJm4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R0wQqBRb5QnYdsFT35xSf299VFaTiRNdeNK763IiQS4QPKWpsl3r93F85oGc?=
 =?us-ascii?Q?ayU6g1y7vaR414Sj2GaLVB02JhPffoJ6bAn436+x7lquzmB5xk+UxG7iHaj4?=
 =?us-ascii?Q?620vTr6UICsoXfF01Kl8N4sdlKOcujftn62W/I0/Of3Bqlx6IZklmGhI08lB?=
 =?us-ascii?Q?O9dG01cSiNYRV9sBeDFb58sOJqR09tDxhflEt8DzrJPaOSwvVlIU/2Sv8WKf?=
 =?us-ascii?Q?k/P3hoGxW8c2nnNn/GgeUscIl2UvQNu3tGv2N/JQn0xPMbOkxLlIVovoILDy?=
 =?us-ascii?Q?LpdciF5cVc2nHE4RnlCsveYSkaz40K2o4VKza3wDrVcwpWV4lKCOVYUDE6yc?=
 =?us-ascii?Q?k/mDfKLmBbQ5wauoMai1hoT36THRmpLyWYfR/hvlUdu650/cLqYCRnu6iXhe?=
 =?us-ascii?Q?UjkML4KrkxJ92Ig4fyi6eE3XBbVbrLu+LAhV5UWYkxO/hJKBHA4RCHI5fB+4?=
 =?us-ascii?Q?QjNzC76Ska/kfyX5J2Xx7b0UA8VUfOgPRQTzyBykG8vydmC7IaSAn1rFSs96?=
 =?us-ascii?Q?mBcqsGwTEfFFijlcmc9Iyj6IOCEaei3DPZKl/Ulln6hyctwJFilyilUqOEzM?=
 =?us-ascii?Q?m7LGrOIPH36Ls2o2E9qrwP4/6+OiY6+WjiwZK6yfcE7+VaDd7AlzED7IZwP5?=
 =?us-ascii?Q?G6I6Etvqm2Na2rDnEEkBN3UBsFdFVHRMbtES5aNBq4UBYscowr9AQGVPja5r?=
 =?us-ascii?Q?Rw8WaW6IZ4jJwhbqHo4qvOetIUvDZf8l1FGyyvlS3E9PFfPeygGSakSxEdjJ?=
 =?us-ascii?Q?vhdBFh5uWmtCyVFf4lhzha+K6kFEBFSFII9GiDvAi3+ZEMviSHF657oBT+cX?=
 =?us-ascii?Q?IU1uIjPyq0W+CtqILzk0JPsDraX3tzJ1WKFpLGAIcCvXX5bMbMMPvw0rRRSC?=
 =?us-ascii?Q?P3Of+1NmOCrjPbqEXiMw+uLohtTtTnUMiOfuy2crsRucFnMYcqyqM7Uw1uMT?=
 =?us-ascii?Q?Bx0GNDdSKB1fFLYuWpq/Xvm0QPc4SyjgfUJjS8L5ddmp/TA/LIeSinfKBN1w?=
 =?us-ascii?Q?pvgoh/uld6vEAAVDHcYFYauCipRaxSUJh7hyK4+XCNcTmY7pXK3Uv5Weipw9?=
 =?us-ascii?Q?i2r9Xc06PSdbctxKqdYZn0nrg/OD0GTV6gumaBYHKFrEhyYb11kIPlSctV7g?=
 =?us-ascii?Q?y6zrvjcdOcGXdE9mAlAjE500DWfwNaA2Rw7kn3UB4rU9RiYCxRSVlKFz3dHh?=
 =?us-ascii?Q?aQ2ox6KnKn4l4dS/GRJUm9IJi6xi/vvZuSRsYwOSNKHUNSg9JVtEGLU+0M+x?=
 =?us-ascii?Q?7Q0WamTzbmc7D0be1g8HF9tI2lDbVudCYVnxCok3ltaf3FosyVuaFP9TWsZg?=
 =?us-ascii?Q?34RuhSO44fHWs+Mxx60t9d4RbW7RKgu0RF8t4FVLv8QS12l9tk05EltLAt/l?=
 =?us-ascii?Q?dQcaVgCd6IEjn6PjHdqP8JA9PSyyJYv04AJrHlOikT1onoyz78tLNwEU2UMq?=
 =?us-ascii?Q?2MBH2dciB/oM5E/ut53NNQoDB3hnnLmRPUkwcbatNiuHo4+6dWQ/JMnXS6Uv?=
 =?us-ascii?Q?gsU+qpfsBfhWXMO9Tj8A2eq/iRn9HXKmvHaa2gfcQDevfe7gtOuLWk4lKdcX?=
 =?us-ascii?Q?vWqiilkUz3Bc9vMOFkGBC7sMPETBA1fOUnECjhN0?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bcd744-36ab-44e9-66c1-08de3c9f275e
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 12:32:19.2393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hasRcMe+saqSjtxpCMCeElSqYC979Zci9yrixjeLypJtT0xcL6a+Puih2U+qxczRvaYX4uyr25Drpj/kJZUJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3277

On Tue, 16 Dec 2025 09:09:01 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Implement Send and Sync for SetOnce<T> to allow it to be used across
> thread boundaries.
> 
> Send: SetOnce<T> can be transferred across threads when T: Send, as
> the contained value is also transferred and will be dropped on the
> destination thread.
> 
> Sync: SetOnce<T> can be shared across threads when T: Sync, as
> as_ref() provides shared references &T and atomic operations ensure
> proper synchronization. Since the inner T may be dropped on any
> thread, we also require T: Send.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> v2:
>   - update the `Sync` impl to require `T: Send + Sync` with the comment adjusted
> v1: https://lore.kernel.org/rust-for-linux/20251211230919.1303926-2-fujita.tomonori@gmail.com/
> 
>  rust/kernel/sync/set_once.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> index bdba601807d8..139cef05e935 100644
> --- a/rust/kernel/sync/set_once.rs
> +++ b/rust/kernel/sync/set_once.rs
> @@ -123,3 +123,11 @@ fn drop(&mut self) {
>          }
>      }
>  }
> +
> +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
> +unsafe impl<T: Send> Send for SetOnce<T> {}
> +
> +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
> +// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
> +// on any thread, we also require `T: Send`.
> +unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8

