Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893922BEFFB;
	Wed, 28 Jan 2026 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569379; cv=fail; b=dm2zRuzL93m1Ws7Bqf8EUCgU6PJQcECx3ZmoGRrM3CQO0O6DRqrMLkrdf7coBRSMJPeBMvLxmdK+Wo0K6qmSGMgl0Ve6zubHx6xI6Y1D+2CzjAw9+rHKNVIuYNLR/hyH10fi/Gxfesm338tmPI9EAl9hJp0E0aSWOr5z2Kb4PWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569379; c=relaxed/simple;
	bh=hP8lIYweT8RMi0Y7QBMNtfC54y0LkWADTe+croPYeiM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EDZcFZRBcP9caf31d8/OX32cRHpVtkhoGksfY0uyZ6k1mOZmyiNUMXaGZMF+yNHUIcIb8f5TacA6aRjWlvtijQY7b2B/hq0RNf0ma85gj2LlKQ+lwJYneS7t7rGBdkuA5VaKW0Jy7ZsnFr8XWWE6/QqzhQ3ArAlSzUA6hj0ofn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rUIGtmMS; arc=fail smtp.client-ip=40.93.196.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUIGtmMS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gH5Gsawhp7FJglfePRw22WqEBGBhkCqNw+gNGZfOJgx4r+7XXdvcMEp3/RcaONTkWEgVAFMkJfi7tLf0eJNrZ+HVIu4qjASXDhdOoucpTAX7YrTqePFVo3KTUv6T+Nlc1fZx8G8UBEUO1xUrfjUOc4AYCYn370oK4EgU+rmeP93GE3Hd0yHoZNKxlmOfx2A/xysGNLKImcdNOJaPy/36JRcO3rANQk7DPh3JR+bFdm6RtAcSnJIrItUv0mwN0iGA9Ow+wnAuxiTZpzN/ieRk2Uhfjs9UifNCU2D2Ixn3CcNquWV78K9AOz7KU3U2mu/HhRxz6WOKKEnglBFFT4PSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5/uA59NFrWBD/gx+wb43qSko9qr1l7S3RUdkSumvdU=;
 b=cPhP2UjvTlJJ2zyg7WGYHal45xslEoANSm0r+xemWozaZySMG9vz5t8wiLBZpmJu8R1iPfPyE8de2AffiBBCNltBGiNrWmFvX2KVf7JmX3dbJhXStCyBGWoQ0PiJUS+Yt0BRsTjjfCDc5gI6wKvvKxqQwbBobzixLMzdcDv85aZBneciv7cO7snMBKk0N1xWsNxL7QoVQN6ZhCrk4pZtyjkX6lTN2Xdgl8cllSicaDMMVCv3sP78GFq2xfIsSogbaCtslk7fOGcvufZ0sGhTDrrPHFQ3D3cP5i0L4dJ9qiEtJ/2lt88rJ0W5PEn2pfA09AaI82tNjPcQkfMPIKfqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5/uA59NFrWBD/gx+wb43qSko9qr1l7S3RUdkSumvdU=;
 b=rUIGtmMSkJdxG9VwgUBgrFQIeooov7cMM7VGVEYvITZp9hUkRcdAyovlCQOxYYezwIPtyQvJ5pptZJH9ZuAzyd8xnzvLirVO6K5Aw4RvOixa+HTPCzPt/xpCYsX3PXe8ylGLbRavgsr7OOaf9hWgtbbYhhRi5jYTA3xn5qeW3ZPw5DpLFI+lM7twZh6yw9BjGHG8hauhHYytfYqulYv5hDgIOByhFCNHM6A9akN1P2i8VbYshJHtSE15JWUoJDwjWCVQ8yz5J9S7K49SIqMeJsX8QXq9HYEHkdAXT1CYCo5lT2EhwqVgpUO09eEay46eXQ5+1HLhpjJACREyqhH/Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7361.namprd12.prod.outlook.com (2603:10b6:930:53::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.8; Wed, 28 Jan 2026 03:02:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:02:53 +0000
Message-ID: <df2772b7-0313-4767-a370-4a4821425f60@nvidia.com>
Date: Tue, 27 Jan 2026 19:02:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260128-register-v4-5-aee3a33d9649@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9639533c-d9b0-4fcb-3747-08de5e19ba68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUh2ZnpWSkpjZDdSYmZFa0xnVmdVVnFnZ2RvT0k1UUhCQzhwTlg2R0ROVlFp?=
 =?utf-8?B?eDdjcVozVXY0YTVEc0VJdjkrcUh0dkpVQUtTVGJLRHBXalR4OWE0ZndJUmxF?=
 =?utf-8?B?Mms4bkdpc29FL3VnTGYxbFBzdG5wa1YwUGpRRURRYkdPLy9TQnJZNVFDSHNN?=
 =?utf-8?B?M1ZBcnNVWTMwRUtFS0hia2YydkIzSEl6NThJVXZFdjdlRmtHWjBhSHBDUWky?=
 =?utf-8?B?ZlV6NTRwMnRTN0wyQlByVnlWOFFSbVcyRktBdWY2UlhiZDVVUFQ4bVZjK0Ez?=
 =?utf-8?B?dGlsbmQzVzhpZElHZkl3MjI3WDlGZ1lCaWwzcXBGaUJFTzlPVFZLZG4zU3Nm?=
 =?utf-8?B?S1FBVVc5aC9ITmorVXUxZFl0eWtzWS80N29EYUl2RkRvdXp5WGxtQ2tCT1VO?=
 =?utf-8?B?WStkRWhoemZ3Q2lzMXQwRm5SZVdvTmhlY2Q5NWlldnBKUGJqYzUxZkJWbkVm?=
 =?utf-8?B?ZzRMajVud0J1NmJIOW5oQVZSbnlzTjJrZTZ0V2RBUlB4cnJ5elhJaXVMdEta?=
 =?utf-8?B?YWg2YWxmakk3Um02OEo1OTZmajdvOU1sN3dua2x2Si9TS2JRSWZKcjZ2b1pH?=
 =?utf-8?B?RzRMNm44UXRQQlUyd05MWThiSXNtTXczVmRrY0prd1c5c0hHZ0dnTThWZ0lw?=
 =?utf-8?B?cWV5ZUF5ZXVELytzVjF6M001RGEwN1V3TDBFSGFyd0g5YlNxaW03YWxrSURP?=
 =?utf-8?B?OXc4bm1uUy9KUUxZOFlKVlhEVG1SN3oxR3Eyd1lGWG5pWmZ3QlJzaC9hZUtV?=
 =?utf-8?B?bXl1VFZ2ZGRSQkg3UTgvWG5mUFVvZTc5dFBGTEs1ZDhkWWNpUVlPNHBtV1N0?=
 =?utf-8?B?eW5lQ2p3SVdHNnA1NnZjK01aSkJNdUF0UmNHWVVhcFQ1U2lPYjB3YnRydGkw?=
 =?utf-8?B?REdDWkVYaVp2WDZWSjVJdW9pSExEbFdIY3lhRUZtaGxqaEdOZnJjdW5CNVdO?=
 =?utf-8?B?NHVWallUZUx5cytSS3NhWnJwcGdqMDdGcmF0dmVvZ1lNdHBVRW5XZk1HaERD?=
 =?utf-8?B?TmNFRHByVnRBYlAwKzlYcjdscEsxbzdvWWJCRXZFdXF3Smd4WDdMOXNueEpz?=
 =?utf-8?B?Rnk5d1BBTzlPN1gvVXMrbGFjRVlscVNMRWJaUFpJMjJDaDFkUzJJbXdiR1kz?=
 =?utf-8?B?Vi9PSS9sOFpSaE5IbUdSbWF2SDhGZXQ3M3Nndm9qK3Y1UGZSUGw3cnMxRStO?=
 =?utf-8?B?Zk0xWTU1VGUxamU1aVFHRWJGek5UZXpPdHJwNzZKclhkZngreUhoRkZKcyt2?=
 =?utf-8?B?ZUR0Z29ibkYwalUyRUJISlgzdytjNGFaSlpqNkdQdnNscDViNnBxa3FyTURY?=
 =?utf-8?B?OEdmZWdkN1JmNkxSbkJlbjFvam9NWUEvYlQvQ1lDc2Fhc001MEIxMlIyTGtz?=
 =?utf-8?B?ZXZQR0p5TUxOVkk1MndIQ3l5azNrcmhLUkc1NUphMTU0Qk5KV0RHdGMvY2h1?=
 =?utf-8?B?c25kS01LYWNvZlMrUEdEemtTV1RRajVpVVZVQy9WOTcrRzNCb09INWJZN2R1?=
 =?utf-8?B?MlZGdWlHak50UWVVb1AzeWFsTGd1d3J4VmZjemRtTS96UUp5dFl1TG9NUUt1?=
 =?utf-8?B?N09SMGRYZ2VjWTV0dUF3MktWc0lVWDErMm4xbWZoVnZvUVZlWmc3K3BUR0Ey?=
 =?utf-8?B?MlM5eDdEb3F0blVWYU91Sjdvam1UdHlUVmpaWXJrY3REMEFxQVN6ak9qSFc5?=
 =?utf-8?B?amVZdnpIUUpBRndjNnhVdnRWVWtUNWFQcFcxbThUZzFsQzVVTU9nTzBNNmxq?=
 =?utf-8?B?TzJEck8yb25uSVJxNy81alYvQXNZWElQbHlsbWI5Qmw0TlBvbnY1SVR1ZFo5?=
 =?utf-8?B?bDN5U2hMQy9WK05jbWg1dGlER3Z3TkZka3YraWh2eVVjV1VSNHVXd1U1N3V3?=
 =?utf-8?B?UHBvQnNGbWZjNzEwSG1WMS9nM0RCc2VTTmZDaHR3Qk9ES1ZlVXdsUkpIOEpC?=
 =?utf-8?B?TEdzQTU2TFJKNTVaMUdrZ0pVOU51bGhtdnhBZWJLVEg0eFdKNHRRaXhSanB0?=
 =?utf-8?B?TGtkR010eU9vR0U3OWZuOFlkMEJiSkdXb0xpMEE0bVMybW9NOUp6ZzVGVFh5?=
 =?utf-8?B?TlcraHNGSWVrWjVkekR5UHFreTdua3lSSndxZmo0NE81UGc0dDJydkpxMlhM?=
 =?utf-8?B?OE9aMmZnaXR1RXhLZDJwb0ZpL0grN2pWQjY0VGtBaDRFYjlOdVMxYmJYZXFE?=
 =?utf-8?B?L0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE1ybW9OZ3NQNUVsRXpxcVlIZHcxZFhSUkZQNlE2Uno4SXFNa1ltNHkxSjdj?=
 =?utf-8?B?SlowQzg2Vks1QkhQbHcxbFpwS3NGUFNxcmx4eHRLbEo5Z2tWTCtMMEQxc3Mr?=
 =?utf-8?B?SFcrZXgxMXRaRWZoNDlNMWVPZzZJdDMvNzRVRWkyZFVDUkFETzl5dkt2NjZP?=
 =?utf-8?B?MHM1Zkt3V3A5KzdvNWNZZ0ZwUXNDSXcwS1B5VjYrWG9WWVlxRjgwYm9tM09r?=
 =?utf-8?B?N3FySTJLL25hTkYxU09Wc2l3VXphSFZ4bnVBWWZQenBwMDhMVnpaWERHR0dZ?=
 =?utf-8?B?SE9VN0JkaDVLM092WWxycVVYa3l6U1FHQkEvUkx4b3QwazEya1llcGxwSlJE?=
 =?utf-8?B?eGFCZjFBUk5zSzRockxsZkVvaFNvcnB2NHgrdG4yNEZ0SU9MOE9MMHAwcmt2?=
 =?utf-8?B?ZDdseDVpbnhadWpwak9xbHc5azdHWnBZZS9HalZ5cWVab1VLdE5CSWtEU2VX?=
 =?utf-8?B?QUFmOG5OdFV1bWkxR2VCR2VETDh2OXdMTnBiOVhvd0VBcmdoYzJiUGthNGtO?=
 =?utf-8?B?YzZkcVNCcFNNeGI4SHZad1hZaE05Nzk4b1JJNmVjaUVrVGVJZlVYVjVVTXkw?=
 =?utf-8?B?T2dxK00zZkw5Z2ZBNUlTNm1zYXlOaFFib09BMlBOaVp2VGlBY1IyVUhYUi9h?=
 =?utf-8?B?S05mVXgzY2Z4V3pmWE1UQkQ1bTRXUmJyRXljc0lTbjVqU3F4MDF6dHBGS0kx?=
 =?utf-8?B?VnptVTRLeG9YU016VEdGemlId2tRNEtDQzhxbVNhS2ZNMFgxOG9MSHNjMlBZ?=
 =?utf-8?B?MlZMLzlTWTN4MjdwQVBrOEs3cXVpaWl0c0U3bmNBL0JyVkhiZ3ozM0hhek92?=
 =?utf-8?B?YzZ1cC9lOTJNQ1kwOHdJamh2SldtY1hORTNoOEF5UEpGaXVESmJDNEM4bmZH?=
 =?utf-8?B?aXBOM2NnMlhlYXorUEVzTS9tNnZTL01wMXEzQUVCekdtakJaZy9TVVdiSEtQ?=
 =?utf-8?B?Z1pRM1dpbVo3MUhyVlVtOHIzRm9TTWExc2s5ZlQ2UkErTUd1RWg1Um9WenNG?=
 =?utf-8?B?ZHNadVRVMnBRbTRDY3g4RVk4cVJRK3Qxb0YvTHV2Y2lJbnQ3SkkvNlpPam11?=
 =?utf-8?B?ZlpGTEFOaWFseXg1TjRLUVcyMW0vd1pKclh0QXFMM0E0NDNEQkQ1b1JNQnlF?=
 =?utf-8?B?eGs0a1lJbGR4L1RkVzgwS3doMDB6OXQ1UCtzM0dzV0lMWUhLdzl3T01XaHY2?=
 =?utf-8?B?dnRzbE5tNFJ6T0Y5eUkxeUJpVWdJN0RHRE9VMmZwREozdmQxSC9Ea3B1TjlH?=
 =?utf-8?B?MnhLNWZEcTVvcnVDUnIrVldTZVFQRnRLOEwwM0VPZkpFb2lRZ0gvRkRVRFVa?=
 =?utf-8?B?RnNkWUlrb2UxZ3dWSzNjMkJIZE45NElrSEhrMlpwZ3g3cmk1bDkySHVtRG9E?=
 =?utf-8?B?eGEyRTJkVEZGY09RTEpIa1JSRk1jZmprVzkrWHQ1ZlFhVHdSZ25qcU5vazVa?=
 =?utf-8?B?T0d1RVEwWnd0ODZuU1dhUmJSakNKSE9FRC9PSXRZRFdrOUt5OFJ0Rk0wR3RB?=
 =?utf-8?B?NUdaN2UwZFZmdlhiQ3o1d1c5enNsWStrUFNISjJDM1NMOXR4SWNlcmluZURr?=
 =?utf-8?B?N0dTTStGZ2IxN0lweGZUOFF1YVlFdlNXTTRHb0h6SXdXT214TWtlNzNTN0o2?=
 =?utf-8?B?YjVaL0NLWERUM3FtSEtNb1lBOGhKM3JpUnE0Rm9pYi9OczNjTE5xYmtjSW5M?=
 =?utf-8?B?WVZqVGF0T3k4L202UHd4QTZXNFo5SlI1Qm9MRWpVRVd3QXU1UGY0anZIUVJT?=
 =?utf-8?B?b1l5UFNVUXZLVzhFcmlDVy9xZ0ZaZ3o4bCs0dFpvaWxuN3Rpa0VldUJyaDgv?=
 =?utf-8?B?L1Azb0puQ1hXOFBnTi8rR21kT1BDY3pHZGtJVHVZSHowSHZQQi9FYVFZdHFL?=
 =?utf-8?B?aDBMT28yOG03OTZsYTJROEMxVFJPTmx3U1dYWTU1WmtKK2hISlhSQms4R1JI?=
 =?utf-8?B?c3liR3BjTmFDMnZYN29ld2dFd1FOYVhFdzUrRTNQYUFMbzlFcmVKWE5mdWdw?=
 =?utf-8?B?TnRaOTU0K0E2enhpcjdiRWt5ZllIRXB4OTczd0FuZEdHeDBDaUdsbTQ1Mk8r?=
 =?utf-8?B?SEdGVy9ENG45a00rM3g1RjJVeHdpUDlBMklyRnZDS1FIK3JsMDNTTmd3U1dR?=
 =?utf-8?B?bk1wVDlaamFLT1E1a2ZtMVVXRkJpRUtncldHK3BKc0xpRXpGV0twZ2ZBdzJ4?=
 =?utf-8?B?cEEyYmVobWdRRThRYVZVSU9wMFBmTXBITGZpQ0FuaUdjb0cvU1JHWXU5eFBz?=
 =?utf-8?B?MEd2WTFYdC9IYTA1d1FkQUI4NEZiZmpHQkVXK0VRS3JYamUveFd3RW9sdGQz?=
 =?utf-8?B?bE92elNwc1Iwc2pNeGNYQmF4bXBmUmNGelZ5eDJiQjRWNGpSNnI5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9639533c-d9b0-4fcb-3747-08de5e19ba68
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:02:52.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeZXPHc0wi85nMB+10uTM/OHVHkvIdVvnWEECPyP0uRnHOV0Y3riUJgVewmQp7fVCaYgR59KDWMbOwf2avrWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7361

On 1/27/26 6:37 PM, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
...
> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can be read by calling their
> +/// getter method, which is named after them. They also have setter methods prefixed with `set_`
> +/// for runtime values and `with_` for constant values. All setters return the updated register
OK, this still looks like a naming problem that we don't need to create.
Let's just pick either "set_" or "with_" as a prefix (it seems that
"with_" has won out, in the v3 discussion thread), and then add "const",
so that the name doesn't require explanation.

...
> +/// // Update some fields and write the new value back.
> +/// boot0
> +///     // Constant values.
> +///     .with_major_revision::<3>()
> +///     .with_minor_revision::<10>()
> +///     // Run-time value.
> +///     .set_vendor_id(obtain_vendor_id())

See, that is just not obvious at all, why it's different. That's why
you had to write a couple of comments.

.with_const_major_revision(), on the other hand, keeps the pattern
clear and obvious. No comments necessary.

nova-core doesn't even use the const_ settors yet at all, according
to my quick read of the (very helpful) [PATCH FOR REFERENCE v4 7/7].
So clearly it is a bit rare, and the extra characters won't come into
play in daily life.

thanks,
-- 
John Hubbard

