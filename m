Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020090.outbound.protection.outlook.com [52.101.196.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1433382C1;
	Mon, 26 Jan 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434326; cv=fail; b=lzB33b6gRsyKdCQX2q+SuFFS5R/hGKgLcW0Xr+02U39UkK3dpSJPQH6DucHFN7lEbuef8srJQSGYtxeKkMDBf/RJx8ZhidQ7111qGOpH8VpgL9KOuxcwgitPub0ASyKRNSLkx+7MZ6K/2lvEwjzY94OFYgkESrwlo6Nq6h3iL60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434326; c=relaxed/simple;
	bh=Ix1PIvdc+gSshJ2/4uldWwiPJN/cb+wdNm5bQWp1Aos=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AeLRClaZVW5R2s9TjIpraFL+fYPxXXJqa/38JpZTn0OSPvY8hafy1/JCcsocXkYipALJCQ+869t2uLsWpTiFY7ScElw2Ni5zApg9EKqdjAQZLE3QdBPrHYKf62/kmBZMNlVPvhBgzfd8eQhgn9q2fHKCfOxNvKXulNCIQ/LFJGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DycML+lR; arc=fail smtp.client-ip=52.101.196.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DycML+lR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8zL7SI/ETva2TjYPD8Ih3dm4hsN8Pbs7YmI8cUF7qtuSsTJWqixQHMh+8Pzpys0+jW/TySehIOXuLAetp09gsnduTYOAaofA7jjI66l+PvKZslBmc4OoRRKkbWicU7BWqvmvcGg0c34WElpJO5fbHVmZ0K0SsE9b+3FGxftqB9M5ZBW6DzdrwvmKOMkudynvBeCjoLki/0mCLGht6hroS+YHZ87KpX09a0bpxdRWpuWHX1nZ8iPXfy+9zKt1irvxit5DZwp0hM1ADoaYUrQ0+NAIW4dnaE1zSRIvj7yJxVV9pUkCCic8sydhXwl2t0ypvR7bgbY40rK0aq3Irx1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ut220lLrtEAX0lKEK/+8QRNSX/4lXXrXBPs76yWhhwE=;
 b=pMlBW4Gax4krhaMCm8kiRjLDfweEcq7tvrj7LRK1+SOOYGMciApn0A9z7gPPJzOQgfZz9sbmm8Unfergdk5arq+vgqZkzS3FgQBznoRPPBipDtg8dvCwSxurp1rgJlBekQtu/egj6lpq+nWIo7RC6IRdiEpPyHGijl/wQkCH5sqHn52fH4E6RH0626Ho7LEj6lW9fzjaXZb+XitWj1s94n1r6ld8HltnVirsv+Bo0Gq54EGQcMBGqoiipoh8IQ+6VMgRWcH3/KsseV0aNCwWY3Thy0B9BUbE/hE45Iu15BGHJUi+zbxMhQABjY3FiWu/Bblfy21AZ4SyhTxj9KYYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut220lLrtEAX0lKEK/+8QRNSX/4lXXrXBPs76yWhhwE=;
 b=DycML+lRuf4KXodIlLTwFqMCFV518HGgwRXz3bi4XjLXXgoMtXMl1OQYxa+KhnluewskHge0cia7R17AU828bKk6VjxC781crAb8+3eIvPayBvql5PD2Mjet62MH5fcAcTiRsH3h7WF/ojjob443w1zP/Zl4iC/o42PyehCjbuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3043.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 13:32:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:32:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:32:01 +0000
Message-Id: <DFYK49OO18RW.2K0RODHVSNXT8@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] rust: enable the `generic_arg_infer` feature
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
 <20260126-register-v3-1-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-1-2328a59d7312@nvidia.com>
X-ClientProxiedBy: LO4P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3043:EE_
X-MS-Office365-Filtering-Correlation-Id: 71034d71-05a0-44ea-1f5a-08de5cdf4a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUlvZ1VhNFpqTitvTERhY3YrejJGUVg2M1o3RU5YVTdEem53djZMWk96TGJO?=
 =?utf-8?B?MHBhbnFMOHoxRjhuYUZZZC9kam1qeVJjMmJJT0J2Q2habUVkUWxkcGtycldW?=
 =?utf-8?B?QmxkUUlvWFZoTzZSZVE3OWZnS2xVcCt2TjZNd1IxMUlEZ0JPK0NaM1lGc3Zn?=
 =?utf-8?B?SzdjTmFFak96YjdOQW5qZnZHQXJERHVlQkJZL0FGOGpnU3VqWm5GOGt0b3hU?=
 =?utf-8?B?ejFzMHl5RzBBRjcxc25RalBkVklGZkw0dGVaU3ZJSjM4L2phNzhYaVEzZytX?=
 =?utf-8?B?UUdja2htVW1PTFlpQlVKTnJPT2E0SXoraHo4TzFucjhwNTZxQnZnWGJlVzNz?=
 =?utf-8?B?VDRTUVFGR2E2a1Nqbm0rUFNqT29UbHhocWFTYjJNV1BnRUd4aDMvTlFiSnVw?=
 =?utf-8?B?VVREQkYzNE9GNGVZT0hBb2VsRERNL1VQTVQ0QkFKQXZGT1pxNzZpZnB5Tjc3?=
 =?utf-8?B?SFg5WjltZHA1eTRvVGRtYkY1VWJ4U2xLNVF6NmQwRHMzbm1vb0x6cHZ5cE9D?=
 =?utf-8?B?aU9kOVJlc3VvM0xNbm10RENFWnY2d2tFanY1aC9xTlovNGFPUEtJMEd5am11?=
 =?utf-8?B?ZXlOeWZnMUI5QlZRZ3NqQUdLWlZteTljZnRrS1lvRGJkcndsNC9Ka3IyVEVK?=
 =?utf-8?B?NjNyNi9sOC9JQzRoeFYyaGk2NTFhOFlaeW5CMnA5Yi9kUkt6QkI0dS9yOURo?=
 =?utf-8?B?RFM0alJuUHowVzZoZzY5QVR3M1lrYjBBUWJ3blJ4eHdoR2ZtTFEweWx5aDJS?=
 =?utf-8?B?VXNhb3pwak92ZlNkZ08zVzRickNNRnZYK1JFMTd3U3hFRnFPNVpwL3BxTFR1?=
 =?utf-8?B?bkV0N0owUmlFN0JoQTlKZ1QzeWxjZHh0d3NoaWVPUkhsNDdSVjVnWWN6NnFj?=
 =?utf-8?B?aHZpYmJ3azVyQlIwc29Sbnc0OFgwWG05YytBY1dqeXRCWXA2akRqM01yR01I?=
 =?utf-8?B?a2pUSHIrd1hsaFdVbzRiYnhRVFVuUmkzNzY4WUNuVmdaSEFOalY3U3dkOWI4?=
 =?utf-8?B?S0NycDMrREdiNS93QVdVSWlpV2FkZXFyRHBHb0ppdFZlbGxvSnllZUUxd2dQ?=
 =?utf-8?B?SkljYUk1MVphRkVlaFc0aWN6SmxaeDhnYUlmLzVHS1lJNG1sSW93bG4zdGUv?=
 =?utf-8?B?S0JKa0lYTkZaNWlHNXFORGdmNFpJZnI5ckt6NDRqTFd6ZTMzcDlPSmxuVUVs?=
 =?utf-8?B?cHd6ZHdSUkpuZVYwRSswTTRGTW9WOGpJM1NLZ3VyT3RpWlpKSXdqNDMzcCtz?=
 =?utf-8?B?aURUTzZRYTZoRy9uY1M0SThlMVRjUjBYQWxFRmlaS1plMy9VMnlFQUlRcjBm?=
 =?utf-8?B?Rm1jdTJBS1ZTUStybHc1TUFDSWFnWk8wc3lqUldBdHlzdGZIQ3Y0ZDVnMEIz?=
 =?utf-8?B?dVJncHN3cDB5VnJ3UjR1cm1abThjS2hNZTI4VWdJTUp1NjdiNGhGam52SXNk?=
 =?utf-8?B?QjZTUGMvaGFiaER3ZXR0U0hQMlZHSDN0WmRRRGxZMW92N210QTBpMmM1QjNa?=
 =?utf-8?B?RjZ3ZnQ1WEdWeEFEVDh3NGVwbk0xcVo1YWlGNTdvMG1SMVRFZ2NJRUpHM3h1?=
 =?utf-8?B?ODFvVXNIVjRWanN5YStkODdUamtHbnJDejNweE1ERFpHMzFXNEdrc04rNEwr?=
 =?utf-8?B?d1ZLWHdmTzZUTlFVRWpTOUxGNjNiZmhHS1V5NGZCUTFLcURQNlBQdm45bzl4?=
 =?utf-8?B?bDhWejN0bTZWWjZkVnE3dXZLV3BuRHVBdnNJeXJYSnpxc2srRkFPNnFtTXpu?=
 =?utf-8?B?NW1NRzhhSzdwLzllS3VOYXluUWVjVjBuMTF6YThucUI1OFRZb2lQU0gwa2JY?=
 =?utf-8?B?eTFNUTlSUnNBYnhzWUN6NHJmRkJUamVWTjY5OEhPbkdXc3JOaXo1Q2JZQzlh?=
 =?utf-8?B?OUFSN3NUanoxbEFhRmEvekpzbER0WXFZRm9VYmNnOGlPWFRmdy9mSzVzeDRE?=
 =?utf-8?B?V01ucmtHb3kxNGxyNWxQS2dyT1JEQXlpVVRjWnpUMmVFZ05DbWVPUG9NM2hy?=
 =?utf-8?B?aTRQbkpMMk45eTRZaDJQTXVWYTJ6Vlhoak1NdGNYbHNJT3RseGFNamxzOVhU?=
 =?utf-8?B?eC9FWG9BOW5uWUN4aGluOHJoUm0xOFA4Y2VwYW83Sk5TM3crZ1F5RG43emxQ?=
 =?utf-8?B?RTArUWFnNWg1b1lRZHlaQXpjV0Q0bExNTlV6dFRqTklIRmppeDVzTFdVUjF0?=
 =?utf-8?B?Smc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVlmaXVFbFE0WHgzNUl0bWpMRmhxRUlLVWVmYTNVczN3RWYxckF0UlJUWVYw?=
 =?utf-8?B?c3hScGRVRURFb0U2eTlJZkJmQzU2TUhIeEIrK2I2blRUMmtLN3FTYWJjVk5U?=
 =?utf-8?B?RkYwemF5aE5vNUk3OS90M25NZjNpbG1ORlNPNmMySlpwVkY5ZXdsYzM2RmxG?=
 =?utf-8?B?Qm1aLzJqVGZWR2JHMVh1RTVZVzM0SG1zYllodXgraTNpUERpSEY0QzZoM3RE?=
 =?utf-8?B?dm0rUHh1NXh3K1JnMlAyZDBKZVBwQTlDaTIzQlByYmI3aktjRTFYdmg5Y242?=
 =?utf-8?B?RjJWRFIyNHVZRzg1S29oR1VDQkc4aVpZd0NsY2c4TUhIbHU0MzJBaVcrdEYy?=
 =?utf-8?B?Nlo3ZXUzalBzTWRGeG16aExSVFFkVWpCZGhuMDFzSEtmNkxZd2VhV1BJN2lI?=
 =?utf-8?B?U2krcG1kcjdlQU9LSythK2VPMkx5TUpkVytRd0NZQmxmN3E2ZnZQcENhaXdR?=
 =?utf-8?B?NXJhT0QraDJiM21EVEdSZXg4ay9maHZHV2c0b2tjYmRWQXFrT2xiakFobjZW?=
 =?utf-8?B?S2lVeTZaTHY4L2FxRFpVL09XTzNaR3hIbmE3dkRNWnFoUVB0S1F1Q0hxNWp5?=
 =?utf-8?B?aU5mQy9Mcy92Y2MrdXpqdWlsZnhKUDJsZDV6VHBBSm1ER0F4c3Z5UTZOU3dU?=
 =?utf-8?B?TGpSbG4rT05vQmJFTDZidDhsVGEzZTdzekdvQkY4RlBuZ1NubjB5NHR6TFFw?=
 =?utf-8?B?bWlKb2wveG1hNjNNaXJxdmpXZkxwQXc4dEFVaHVmcWk0NmZWeG5qOXgxWFdY?=
 =?utf-8?B?L2ZUN1FGaGFmeC9wNkF6THVUVU82bk5uSlp1SWN1NkF5Zy9iQnJYVnl3aUdI?=
 =?utf-8?B?eHcvRW92dklzaWxsK3ZiNHEwMVJ2SXdORno4cEY0MlNvR0daNzh0NTJGWHNJ?=
 =?utf-8?B?bGhWVFFzZ3V1N09IRENUWFR4U05USU9RZXlyUENjbDd1d3dqZEZ0Yk4vd3hP?=
 =?utf-8?B?UjNCUyt0LzlCY0l3TTFTRklCazh6ZlNscG13S1J6ZFhkUXBFNWFGYThmVjQ2?=
 =?utf-8?B?MUI5dFlKdjdhRzZBSGhqMTFoRnpjZThGWXFYcmhQTmNTQXBmcGxGeVpYZkd6?=
 =?utf-8?B?eFNWa0hZeHJHQncvQ1RXZzdiU1NLczhXU2h4Zm5zU1oxdDcyWTJXQ0VuYTVp?=
 =?utf-8?B?MVErNUg2MFh4NWtZaVZHazJENys3bXhPVjZmZ3lkTlZnWGI4SVBEQkRxemly?=
 =?utf-8?B?cXNKcTJRa2U1WlJ5SjErZm5oWkFFcjNUNHdpL0oxdmlna3lTM0Rva2VzUnBy?=
 =?utf-8?B?aGJRMWRqcHJoVDlSTUdoZFNCMGJrRE9aUnJrMWhzTXJWZEwxU2JINWVqMkpv?=
 =?utf-8?B?RlRzRGFNSStsbDhJaG5HbTVtZktSL1JpRnpKK3BkdUJDNkQrK3JrVExpUzB0?=
 =?utf-8?B?aDdRSjBqYXE4ZXkyaVZvS1gya0EvK1lFUEQ3WHdMcmhRWEhQQk45L1h3YURZ?=
 =?utf-8?B?aGhWTTVkUVVydFQrbzlCQk96SlFDcVBUQktDVGc4cWZFMzMzSzBhcjhXV0wr?=
 =?utf-8?B?cnFWNVh1bm92bVZuY1UyYXE0WEROdm5BV1dqYksxYkh4TkEzdk5YZUdMSi9D?=
 =?utf-8?B?RUhIS2JMalNrOXR1eFpJV1B1TXFvblFwUVlOT0Z5cnpHak43MWlMMmg1ZUJa?=
 =?utf-8?B?clNBWlRhb3ZBWVZ3SFhFVy9PMFh6Ky80SjF0TktkSHBpRis4RmtpNWN3bjF2?=
 =?utf-8?B?WWYzTXpIdUJmdlNzWEJJS0RMK29JS3k4cmNTeUZhcXRNUVFqV052bEtTU1A1?=
 =?utf-8?B?UzRqbVQveit6NURxZWVpUFNtMnplNEI2ci9EZktqRE1rN1lrUldISHVVTHJn?=
 =?utf-8?B?RUI4a01ZV2JLM2dMNVpTc0ZKS2h5Y05TcWtXZEZpYVYwV3NaV2dEMDBsT1hx?=
 =?utf-8?B?SUFzb1pjbkNkekc0VUhYa0YybWg4TE5HZXo3NmdiTDA3aDhTVE4wZ3FJU2FJ?=
 =?utf-8?B?dFFLK3RYRERHanN1SGQxK2NIaFliU1RmWVlKeXNnaFJBakQzY0ZoS293QnM3?=
 =?utf-8?B?V1o2SFVwTlY1S1BmeEU0TzVvVWdPcDdLazQzRnRidWZrTWtQdlQzMVcweGhL?=
 =?utf-8?B?RVBsWXBxR3VZUHE2citUZGtzUFdBOWF2RzZkZDJSWmtQZldUL1RqUDU5YVky?=
 =?utf-8?B?cjE4K1FSc0lqNUVhbmRyOGFzeWlCa2xPSVl1MDY1ZEh5aTR3VThFVXNNdmdE?=
 =?utf-8?B?eW5iWkhNbTlTdjB6ekVZQW1iTExRMFRERU5TZkdiRkpqUjVnOElGNWNmdU5J?=
 =?utf-8?B?VUJzeEJsdGU3eGlKK1dzNVRwQ2srcmRNWnd4RWllbWFwTUdOdE9pVUlWY1gx?=
 =?utf-8?Q?wAdlFaLZYlrhwkNIzP?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 71034d71-05a0-44ea-1f5a-08de5cdf4a0a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:32:02.3371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63+53pI1zGmOZF/gAfQ2fTgsA1tl9emBBFWzsFwovH1/y5ZaUut79YdWXgi8vk4vQ6A60xkqpwoZPj4INoL9og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3043

On Mon Jan 26, 2026 at 1:28 PM GMT, Alexandre Courbot wrote:
> This feature is stable since 1.89, and used in subsequent patches.
>=20
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/lib.rs     | 3 +++
>  scripts/Makefile.build | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)

