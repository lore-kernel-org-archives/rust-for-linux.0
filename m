Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190608;
	b=SHzwhhOLRkoCZGyvhHDQAgsluZ34hFZvR7FN8IsKWrd/qXHP1lAESD45X8SvpJH/WHr5
	 6ysXRGT3c5gQOhE/ybP8dQ+RadqWjA6rc2POUPIlIAL1xY9UKPkmdCrvzicjDsUdTZeLL
	 2k6e14PEP/XVXSWcdQ0TqdbkZs1Z4hwDzypCQ/vTgENacWH1z4s6K4AKQTBPKLo0NEzaQ
	 jmjQrLOvbE3ltOwgd13KLRacENiQdPxbpbmBn7G5ym2jggSu7DM5XTnbZZ04nnuMspRqC
	 nf6aaWVYmBGrnGOyAdWETgFLZWA1FQalsD/W2MDXa1zembYXsd9xVuvLTElTXCgYFKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190608;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-MS-Reactions:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ETeQz0UISpgvTh2RFFF/IXr7X1r/QpLrPnknQWUoGs4=;
	b=iNbl1ImMJBlBoZ5qu5yeY2KMvheAkZSesTz5Tt8cOPkMWukYez86bVhARZxyeeDzunqX
	 9C0OWkfUXGdT3MQvNlOWoym46qejJ3x46S49hT52nBhnc586hwbSJ9Eas1bHmKZkx/OjV
	 T8ES5uzAPln9iK7oldmNEG3FztJskSf4D9/cOoGa0xCHbUINJkoR5xD7AcJsA3Ghjt/WA
	 VzYQZToT94LgknYad7UQjdZYIUpj+SH7wyVW7rd7sckxVTS0nMMRj29etABc6qtDMm3vy
	 VmaxnnNi5Wc+3iMJOsX7fl4QL8TIqqHEWJrroBqUPQBQPPqfhVQSSRvC6xMo0yQDoaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MpiGm9e8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.43
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4FF606A320;
	Fri, 20 Nov 2026 16:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MpiGm9e8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6OaO9qCR3APmPO8DJgVYVp3M+AX65BX1cSvvK7PhR8wd1Nv76I2v5qNObmgmqRb3g4AZ78pFBK3biYety3wiGGR+r1dxWdnolnY9/De1u3bomcz2ComGfHTIxChm8H9JfGMe07dhkhhePpN7j/9w/XVKAgPngqI8k3VXf+GDRUk4w9osiSoHs7t6CCpRmEVKfnxg+h9dvCyWuXmJxor60G1YpR8jKhB+YqfNmrOJaAHa+av4PAqOHBoxbxZG61N79qipjwD2W7b1piQrdLSqF0OaRjLMnVac8mO8pPRrlfQeT80JkU1t+rNGibr5hg0d8UAA1z5CjfSTczxZhuVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETeQz0UISpgvTh2RFFF/IXr7X1r/QpLrPnknQWUoGs4=;
 b=dJFT4xna1A/O28NpfU+ZtlohnprkgTIL+F1AaXLMuEEl71XJPh9aaXs+B6l8AtsehpvgrCr7UFdvYpJSzb21unHs1Csmv3lrjVXW2kqAq4TOi6dHWNrtd2xpCBMTxpWajYJUV9bOqstK/LPiX4+ejgxKVghhzzA6ha4mlY4bh69SsvqXGwQ1+8KvH849wcIuCR2kypuGhhM7XO+uBSofXk6Npkyh0r8j82U74g5Yfy3oFzqbhu9IJXhx4eYLYXAJd36RzoxbjHICCD13txMm/yuEUxyT7JtMbnkiTZ9avx/on8+xTFN1DeX4y2z2U1FmJuV4Oc58gxepQtRtJDeljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETeQz0UISpgvTh2RFFF/IXr7X1r/QpLrPnknQWUoGs4=;
 b=MpiGm9e8CbA9RSBlBPXoFm9XtVB/OHZonjcONGetETJVuePNZR6f/Zf1//3UPbV7jDX6iB5jAKJ538t02uVctcnEIOkGTaTonXcnMH4XWsTz1iAMumw/i33uvvCmXTx/vuXm6OqUBclX8pilmUx16vP4jxA0I3epZG2PlQCYYCg7DfWG3h+JwqYSK8cUF2uTz3FvXfahFDpyaXo2L6/CRF+EG2lA2AnaJy6M1SVnj4iKiLHfEDW8HQzzcDO6qRwI8cl/Yfl8gTpBmMeuIdOQ6xSmrhO9s4aXYeBHkerWeQZvmHqlGXGzYvoPUT0kq3oGQGm1TENa0GRs1iXnZMwYtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY1PR12MB9604.namprd12.prod.outlook.com (2603:10b6:930:108::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 16:03:19 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 16:03:16 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Mike Rapoport <rppt@kernel.org>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?b?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Igor B <igor.b@beldev.am>,
 Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v22 0/6] rust: page: add page kinds
Date: Fri, 20 Nov 2026 11:03:13 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <C1137621-6CF4-4C52-A40A-C2875D37EC6F@nvidia.com>
In-Reply-To: <87se0vu2ul.fsf@t14s.mail-host-address-is-not-set>
References: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
 <37B6D4A8-288E-40E8-9214-EDABBFE49C39@nvidia.com>
 <871p8iue5y.fsf@t14s.mail-host-address-is-not-set>
 <3C3421E5-5B7D-42B8-ABD2-185375693D7A@nvidia.com>
 <87se0vu2ul.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0775.namprd03.prod.outlook.com
 (2603:10b6:408:13a::30) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY1PR12MB9604:EE_
X-MS-Office365-Filtering-Correlation-Id: 1962f0f9-062d-4442-137c-08df471fc9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|261022105027099003|5023799004|261026140227099003|261028144727099003|261021123027099003|56012099006|11063799006|4143699003|261021121427099003|10067099003|261102123227099003|261022075727099003|18002099003|261026121527099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D1UTprYju0g9uoB03Ev2+5B8EOOeyQP55u31WodI3ERT58Zy1Usnnz97DTVuGysL1clsypkXOm1nrxO09syI2U/jo6jtQiMen9gSrBE1F2iAD9nCbJ5oFfZx6Rk0hRp87FFopLHxfIkIHbIgMaDKDgs1EQXu3F+P1DXBqr5owHwT+yWqKDUsTPVsTcl3SwuG3zCOtvFSk/6fuGCNL6t1kZdZNR5Dm6B84RtwcT0UcldKp41FkMd66R3Q02qXTlFhqwvncSz+hGh5VtAIhDK70lMDjjGz3YhIX99Srwjp/rkwENJ+m1YrhuLFUVsoU+t1dlFQyI1gn1olMXbByk0Q4QCMpqznCMszCElMNMt66C1E+nD6p7GaphBFUXR+NQgtYlgZLhAdDpSUbSBfoHkI3WxNfyTRQpdmJcOAxUFKm2Geg00hbsxOQJK2aV7+veMXJ2yh3tt19O4NbZzhkPg192c4Th3SN0aidU80/ccp+bDln5yYuptTF72S3gMpdf6IEdjowWS4JnkdyI/WNg9EcHv159OT5A4cfcJ2aDgvi48AY3citqjq9ldJmv8doopRAxTyTTbxFh2dMD2++EmZf0VTAmYS/lAxjr+nj2SJQf3rnXMru3j+OFzg+b6ymZm29EuutxBz5h+W7EY2eHGI5TzSzHhUjDR4Br87I2WPZYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(261022105027099003)(5023799004)(261026140227099003)(261028144727099003)(261021123027099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(10067099003)(261102123227099003)(261022075727099003)(18002099003)(261026121527099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmhOQXRUa09xeUkxN0NYdWRJTC82dVpzMHZLQzlrR1hudmdMdXlVV2w5ZzVI?=
 =?utf-8?B?NGR6ajVPeTBIOWp4aktTMjFSSlVNQ29uT1dpVmpWQUNRdTRRUHF3b2dMYWdF?=
 =?utf-8?B?R2Y0WXpSS2xTZlAwYVA3d01GZ1g1bUdZNHJEWEFSNERRcGJhNkYyZjBGZk4z?=
 =?utf-8?B?YWkzajBzNzlnOGJLdHBLN1RWa3NtZjUrU29kcDVtWXRJVU9CYWFpLzBUdFd0?=
 =?utf-8?B?bEUrZ05kVDhsWVJ0cG1abGFwK2Z2VzlYZGVEYWRkelNWTzVPaitnNWZpOVhU?=
 =?utf-8?B?Q1JTendIZ1F4dlpuMk52a203dUVKZlFjZGs5VVJSUlo4SDJ3WEZiRVZ3cnRw?=
 =?utf-8?B?NzBJOEE1UUNoNWhrTmd2aUFTZHJkbEhlUkJJZmFxVGhnckdXSlkrOWxpUldq?=
 =?utf-8?B?Wm9Xb2E1aGhTR1FEVFhmUVpNeFkzZmhFcHBKS1p4QlFOZXZOc3gxanNiVzBY?=
 =?utf-8?B?aDZVOFNiS1BPemM5VjhneE8vY2MxVmVHVDZzMGVEOHVHa0lOVUJXdFJRMkR6?=
 =?utf-8?B?ZFRJcVI4UlE1cHFkSyt4OCtGeUtLc01yYXc5UUpLUTV6ZVo5dHlGYTIyRlhr?=
 =?utf-8?B?b1hKcy8zaXRteGVYNFlHN3F4ZTFyOHY5S3F3UmExWG1OMnh6Ri8zVkdrd0VM?=
 =?utf-8?B?bzRPMTVJVk5QcUFwVDVDNWoxdjk5TWNGMVhneG1VQTJzTVJNUWJmb1ErR3Rl?=
 =?utf-8?B?eW51UEg0MDRWNmxsa1hDc1NQdVpIdzRuWnEzRHBrVndsR2hSSHlFS0cvVTBk?=
 =?utf-8?B?ZG1QWjdRNWhoQ2RGT3ZzZ1I0b3ZXV2xKZzhlR3VhMVNKMCtsa0ZwczBxSm1t?=
 =?utf-8?B?UHBiclBHeHorUXRjemZraWFTb003U1pJL3RiQmxzWmlqY3RPdUVGblpWeUFC?=
 =?utf-8?B?ak04TmVyY3VyZzh0NWt6SGFuYW1aRnpMWlB1L0tTWnNDdnk0ZDVHaUR3ZDcx?=
 =?utf-8?B?MFZtN3BFL3h6Z0kvUXB3L0hUWnVUQ0t6cWVzRzlmeEpRSDVock9hZnE1ams4?=
 =?utf-8?B?b1JGL0hOd2VTTHVZbndQaXhRaXlBVG1jcDFzdkdUR1YxOGdvakVidHh0ZkVT?=
 =?utf-8?B?MjZOS1pvS3dEWFdsRmdUM2dNUHM3RHI4bitzZlljbVlsZHBOTFBQSjFwUlRh?=
 =?utf-8?B?dFZNQVpHUTZKWlpMbHJpeFRJR0lSUUhyM1hHVXJpL01iRVJ5U0Y4VUtXWXpk?=
 =?utf-8?B?QzNja3g3Z2lvbmVINHQ0bUtERnV2NWY0eHAvckt2dE5VL01ycGtqRHltVGpQ?=
 =?utf-8?B?VFRXVDlHeDl6WEIxOG5Jcnp3Z29idXpvQnlta2ZaQzFMSFFsU1Z2M0FpUXNU?=
 =?utf-8?B?WFdVanVaQUV3ZVZlZ2xTb3ovU3NCMFh2L3NyN2NoMWMzKy9BYm9vL0JnV01o?=
 =?utf-8?B?a3NxQjIwS1lOS3JqWE1NODNycWlYcmlIV2dWalBjclFrOUZwWVo5N1ZoS0Vq?=
 =?utf-8?B?R2JQYlNnZ3Rla2hjbUluZGlPSEtieHhHTEdySTdVY2FuRTVEenlsRUl0VjV5?=
 =?utf-8?B?SGJ3NWtBdjV0WCtLUHJHVnpIZjBIbUNIR1lob3pTcGlSS1FoNmsyeVBxcXZ6?=
 =?utf-8?B?MGNuSS8zSmZ5TjgzRWk1a0JiOHJRbmt4MkpBUVltSjd1Vkl6bitHTENmQ3Bk?=
 =?utf-8?B?VGpUbXVrb1FKM2JCdG8wNlFxellXMVRLc2cxcDNUOC9yWVh1ZUpXK3Nndmx1?=
 =?utf-8?B?Y1V4ZXBIcTFVMWk3NDFWWEtNSHBWWk1ETy9PQUh6MG1KZW1RUXErQzczTGtx?=
 =?utf-8?B?a016YlJiZFVDMFdxYU1UYXp5QXlEdVkrVzRhbnkyQTZ6WC9uUWhrZEU2UzBy?=
 =?utf-8?B?UFl1R3Z0N1ROWklSSDE4bmpvUk9ydm1ETm5rZVBvZXY5d01qc1lQUngzVGN0?=
 =?utf-8?B?WXZCdUtEdm9SMjc4ajEzaVlHL1R0Wk1YS1FnUDhwZjByZFNLc3pwTzVQNVND?=
 =?utf-8?B?U3h6VjFvV0wvNWFBbEJMWmN3TGRUUEVsZHZVd29PMXFtZkc4SHFHSHNrK0VJ?=
 =?utf-8?B?U0ZIWVVvR29DaENaaWxTQUtLY3ZpZk5CUys0a3czWXlEUTdYSFJiTWt0Tk1I?=
 =?utf-8?B?ZXBLWFFJUDRpTHg0aGYwMmwxRkNPM3VreERybTArTyt4ZFk1QUttRG9lV1BK?=
 =?utf-8?B?M2hBTVZUNVZVcU9nZW1lam9EaGNHU0xZQ0FJaEF4ekhlUi9lbGJ1d3htb2Fm?=
 =?utf-8?B?VmlWYjhJZDNqWmVqVk5vWXJkbzd4OGpNT2EzUmVQNGFGcUtEQTJYeFlHbTJO?=
 =?utf-8?B?MFlvZXdMWUVDbmxnaHN0YUU0Z001R1JHaWllNGRrMlg0d2lHVUhxdjFRR0VH?=
 =?utf-8?Q?uBGduTO0j8mXfpIE4e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1962f0f9-062d-4442-137c-08df471fc9ac
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:03:16.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIXy3gNE4EOP7zO911YT2I/pwgexN7JfKSgLaRKF82YH2UDlV+ArjyoWshRLmjv+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9604

On 20 Nov 2026, at 7:03, Andreas Hindborg wrote:

> Zi Yan <ziy@nvidia.com> writes:
>
>> On 18 Nov 2026, at 14:34, Andreas Hindborg wrote:
>>
>>> Zi Yan <ziy@nvidia.com> writes:
>>>
>>>> On 18 Nov 2026, at 11:18, Andreas Hindborg wrote:
>>>>
>>>>> Note: The page patches were part of the `Ownable` series [1] until v21.
>>>>> This series continues the version numbering of that series, and it depends
>>>>> on v22 of that series for `Ownable`, `Owned` and the split of `RefCounted`
>>>>> and `AlwaysRefCounted`.
>>>>>
>>>>> Not all pages can be treated the same way. A page allocated with
>>>>> `alloc_pages()` is managed by the page reference count, and kernel C code
>>>>> routinely takes its own references to such a page. A page owned by the
>>>>> slab allocator must not have references taken to it, but it can still
>>>>> show up in places such as a bio vector. A frozen page has a reference
>>>>> count of zero and is exclusively owned by the party that allocated it.
>>>>>
>>>>> A single `Page` type cannot describe all of these. This series makes
>>>>> `Page` generic over a sealed `PageKind` that describes what is known about
>>>>> the page:
>>>>>
>>>>>  - `Page<Base>` is the base kind. Nothing is known about the page
>>>>>    beyond the validity of the `struct page`.
>>>>>  - `Page<RefCounted>` is the default kind. The page is managed by the
>>>>>    page reference count, and `Page<RefCounted>` implements
>>>>>    `AlwaysRefCounted`.
>>>>>  - `Page<Exclusive>` is a uniquely owned frozen page whose data area
>>>>>    follows standard Rust aliasing rules, so the data is available as
>>>>>    `&[u8]` and `&mut [u8]`. It is handled through
>>>>>    `Owned<Page<Exclusive>>` and is the first in-tree user of `Owned`.
>>>>>  - `Page<Frozen>` is a frozen page whose allocation is uniquely owned.
>>>>>    Unlike for `Page<Exclusive>`, nothing is known about who accesses the
>>>>>    data of the page, so the data is only available through the unsafe
>>>>>    raw accessors.
>>>>
>>>> Why do we need to allocate Page<Frozen> when we can allocate Page<Exclusive>?
>>>> To me, Page<Frozen> is an observed page state from a non-owner point
>>>> of view.
>>>
>>> I'm not sure we need it, which is why I added this note:
>>>
>>>  This currently has no users, but I add it here for completeness. Let's
>>>  discuss if we should keep it or not.
>>>
>>> The difference between the `Page<Frozen>` and `Page<Exclusive>` is that
>>> `Page<Exclusive>` has stronger invariants. Namely that the (physical)
>>> memory region of the page does not incur data races, and that the page
>>> not in highmem. From a Rust point of view, this allows us to obtain a
>>> reference to the page contents without jumping through any hoops.
>>
>> But access to memory region of the page is associated with page table
>> mapping or IOMMU mapping (for device, and I assume devices are accessing
>> data via virtual addresses instead of physical addresses to avoid further
>> complication). It seems that you are trying to use page refcount == 0
>> to infer that no page table mapping exists for the page. But how about
>> kernel direct map?
>
> `Page<Exclusive>` has the invariant that it must not be in highmem, and
> as such is always accessible in the kernel virtual address space. As far
> as I understand, this means we do not need `kmap_local` before accessing
> the contents.
>
>> Anyone with struct page can use kmap_local*()
>> to get kernel direct map and access the page content. kmap_local*()
>> does not reject frozen pages.
>
> `Page<Exclusive>` is a unique handle. Nobody can get a hold of the
> underlying `struct page` to perform mapping operations on the page.
>

Right, but if kernel direct map exists, how can you claim
“the (physical) memory region of the page does not incur data races”?
At least, “assuming no one is accessing the region via kernel direct
map” could be added.

>>
>>>
>>> I do not have a user for a frozen page without these invariants, but I
>>> would assume there are use cases?
>>
>> For the above reason, everything is Page<Frozen>?
>
> Pages that are part of user space process vmas are not frozen? We see
> these in system calls for IO.

Sorry I was too vague. I mean Page<Exclusive> and Page<Frozen> should
be Page<Frozen> given that kernel direct map exists. Strictly speaking,
Page<Exclusive> should be pages allocated without kernel direct mapping.

>
>>
>>>
>>>> In core-mm, a page is frozen, when its refcount == 0. The code looking
>>>> at the page knows the page is exclusively owned by others. If the code
>>>> allocates a frozen page, it will not check its refcount, because
>>>> the code knows it has the exclusive ownership of the page. To reflect
>>>> this, the code calling alloc_frozen_pages() should just get
>>>> Page<Exclusive>
>>>
>>> Is it always the case that users of frozen pages will use them in such a
>>> way that they can guarantee no races to the page contents (physical
>>> memory)? They cannot be mapped for DMA access or anything like that -
>>> that always requires a refcount?
>>
>> See kmap_local*() case above.
>
> Right. Both `Page<Frozen>` and `Page<Exclusive>` are guaranteed to be
> the only reference the underlying `struct page`, and so nobody can do
> mapping operations from under us. The difference of the two is that
> `Page<Exclusive>` provides guarantees about placement out of highmem and
> no races on the page contents.
>

Sorry for being pedantic, but IMHO “no races on the page content” is
too strong. LLM tells me, let me know if it is wrong, that DMA map
code does not check page refcount and currently gives a dma_addr_t
for slab and kmalloc pages, which are frozen. This means a Page<Exclusive>
can be mapped via dma map C code. What is the plan to prevent that?

>>
>>>
>>>> and if the code encounters a Page<Base> and finds it has no refcount,
>>>> it should convert it to Page<Frozen> or there should be a method
>>>> that accepts PFN and return Page<Frozen> if the page of the PFN has no
>>>> refcount, for PFN walkers.
>>>
>>> We can add conversion functions, that makes sense.
>>>
>>>>
>>>> “the data” mentioned in Page<Exclusive> and Page<Frozen> is struct page
>>>> data or the data in the physical frame pointed by Page<...>? If it
>>>> is the former, is it better to use metadata?
>>>
>>> I'm referring to the actual physical memory region that the struct page
>>> describes.
>>>
>>>>
>>>> I am new to Rust, so feel free to correct me. Thanks. :)
>>>>
>>>
>>> I'm new to mm, I really appreciate your eyes on this.
>>
>> Do you mind describing the high level workflow around Page in Rust?
>> From my point of view, exclusive page content access is more related
>> to page table (including IOMMU page table) than struct page itself.
>> struct page ownership is more about the metadata stored in struct
>> page for physical memory maintenance.
>
> Just as in C code, there are many workflows around `Page`. Three main
> ones I have seen in Rust code are:
>
> - Pages that are part of io buffers during a syscall. The pages are
>   mapped in at least one user space process and the kernel may want to
>   read or write from/to them. These would be `Page<RefCounted>`.

Is RefCounted too broad for this? A refcounted page might or might not
be mapped and a mapped page might not might not be mapped into userspace.
Is UserMapped more descriptive?

FYI, I am working on adding PG_folio to distinguish user rmappable
folios from general mapped pages. In terms of pages mapped into
userspace process, they can be either rmappable or vm_insert*()
into userspace.

>
> - Pages that hit the block device driver API via the block layer. These
>   can be anything, so we model them as `Page<Base>`.

Even they can be frozen without a refcount?

>
> - Pages used for backing storage like in the null block driver. These
>   are modeled as `Page<Exclusive>`.

null_alloc_page() uses alloc_pages() and gets refcount == 1 pages.
unless you mean struct nullb_page.

>
> I think for the first one, binder is inserting and removing pages from
> vmas to do it's IPC thing.
>
> If someone were to write an allocator of some kind, they would probably
> reach for the `Page<Frozen>`, as they would like to have ownership of
> the metadata, but not the contents.

Probably.

Best Regards,
Yan, Zi
