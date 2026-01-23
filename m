Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022141.outbound.protection.outlook.com [52.101.101.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176303EBF1B;
	Fri, 23 Jan 2026 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191492; cv=fail; b=HIA62G4Jp7r0P0SE72Y8DvpcCY+921lzDXAYbEc3hh95V7I9gE5b09EqP9Y2/LBaBvfv/Ogev62K6crR2Moiod52lmYgDlrTlTl6ifXS7TQY79NmlLPp8MSSgK4PuSVoZQYBaZiKngFMaja4QSbnuHcRz6CV7LFP9XX2atduNn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191492; c=relaxed/simple;
	bh=wYWKWbnyNhfWFqft7IwinA6sN+gt2/+Ee/fFZLoVzzs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mLt7F827O2HDCaIaQiB4ENBsW9e8QEKLS4PL/rYa6ETzavsLBMtWeILhHbfY4qFs0ixywbhAcnhcx6F2WDqFN0Ej1JQIec2dR08pv04xJ9jNHZA9KlPy77PcykQqU0q6krK4xkJys1hMcf1L45HCRUGZ5VgvllnQVNLCHP1/keU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=s1U0ZZYA; arc=fail smtp.client-ip=52.101.101.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="s1U0ZZYA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAuzLeZWs9hGyPlggIDwEYFHaGjb2iEq/BsDI7FN42+TMtqaGq6v3bthG+YjKBzyWaa51VKjSqdinMcSK18OckMoUQmdmJZDHcpBJaWHrpp07S0z/Oj/+otIEXGvFxnGzCpWkHy2Ndfxec2x05YKHhpIsDt6NO6Z1ElmyB92I8n4h48RZxSGYqemElGiv4TZGmVasCZLRHVQ7gaKfcWSmNXYC3wFHaklF7+q2uRH3rmc9EpKqAMtgO5s1hAbmTg9WnI7YxcS3Ws1TaNaNZe51I1HAMFhCJiNlh2te36PV1EcLX72l7ubGTdqFV0YD8qUgi5o9hg0qpNm4PHtZ/mMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYWKWbnyNhfWFqft7IwinA6sN+gt2/+Ee/fFZLoVzzs=;
 b=yqfmcpKknOzgA+dpNn8SzpU10xabVD/+PZEOPnxatAYcQLAOxdkT7s5a1VMj0c0Y/d14/gC+lgoIlwVICbRMaE+ibFTxEtqAmFswAUomFlT5KHJZlq3SXZ1kZjcUninTGk25Cj1ld/31nnWeu9CHAReVhbKlqRGZY4JE577bQrvYhxRS+1hjLC8gk32O7iVralxphECP6xf/knzFETRXp8BoX4RYk/Byyw9Rr+yKhQzj7a+4aDKjU+LMvsSZyxJHmxz4cMyIBHvTG7t9lsiqu6lGDvewYoPgn1NsSxXokyli+PlqkQRoxirHpl8GaoRVQ29jb6dnjk+7KZp9nGLnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYWKWbnyNhfWFqft7IwinA6sN+gt2/+Ee/fFZLoVzzs=;
 b=s1U0ZZYAv8r6xBof3XWGVp48Bum6kl6/Mv3t9e60ZQZ4XooJAfrt5DXLwa+QyipUBkruDv3hSEM1Od/BfKQ4HW+1WYH5+LUwKpXIFPNoMiRmF6asrh2ItT8PiYMHBG1ty58BcfbWYRRN473WLfYKSpjwbmTE6+kXPXFvJNsCqNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8753.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:490::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:04:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:04:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:04:47 +0000
Message-Id: <DFW61H1H3EES.3109E1KP64IXA@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Gent Binaku" <binakugent@gmail.com>
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
 <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
 <03f705dd-0135-40e8-9003-5d2a626bc439@nvidia.com>
 <6d325ce0-f5b6-4e81-9f66-d48d1e9e2000@nvidia.com>
In-Reply-To: <6d325ce0-f5b6-4e81-9f66-d48d1e9e2000@nvidia.com>
X-ClientProxiedBy: LNXP265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: e059c122-f389-4de7-b0b8-08de5aa9e57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVcyMG5jVmtYWkUwVTJzZkw4dGhIWlFmd3VoeW9BWVhzYWJBcjI0UjBvZWxI?=
 =?utf-8?B?R2VTSTAzYTFXUGRaNHRCZEJaSTJGd0FUYTVUM0lub05CSUpPSXI4REhwSUox?=
 =?utf-8?B?YVFHSXFMb2VEWFREN1g1UHN0YmZiQ05oZjlOTFNBUjlCMEFLZEZSQjViSFJH?=
 =?utf-8?B?S3NlNEZ3L1hXdDA1RkROdCtFcUJuSnBlR080VEZJN0JHY2JzNlNJbnd1V2VU?=
 =?utf-8?B?T1VjcTQrc0VxdGxqSmVZSTU2eFVZTlB2Wnl6NTVDcE5IdU03TXVkYlczNEJP?=
 =?utf-8?B?VTdmbE5jdTRWWnJ5ejhxaFc0UExkZFhkVkxneXphK0RzU3dkQ1VpdWFsTWRo?=
 =?utf-8?B?TWpXY0M0bE96M3FqT2d6NDBsVWxIK0tuY0FUSDZFWFJ3U241amN0M290bUto?=
 =?utf-8?B?dWU3eDh0UWRlWHFjSm14akoxNmFmV0MzelFyWGxJOHVSYlN1VXFhay9DNWZ6?=
 =?utf-8?B?MTNRbzRXZGRKTGNXNGphVFlpV0c5Ym4zaXZTbVJIcVlCKzlUV09WWW1FU2FV?=
 =?utf-8?B?OHhGL2xsWUQzejRVOCtZSXpaRmRqaTFrb2hqN1VNZWg4cVVDR2NvTThmVXlU?=
 =?utf-8?B?MnJEZ1NXeldEN1ZCUjBaS1ZTVzhVYUQrdE8rT0pTU0tXZUlEZnR5MUxwYU85?=
 =?utf-8?B?c3RJd2o3OHFRa0g0eVNZY1ptVnVhVk1yK2h5ZVF1eXhDbG1naU1rMjFJTzN2?=
 =?utf-8?B?eDdjb0duQUFkdW5pSmkwUTF4ZG1nWlpIYUtKSEhpSzFIVDh3NVg5Uk1kN0Vl?=
 =?utf-8?B?bTkvcEwxT1pHSm05TlRVL0tIZGw0Z0NYTnRrMXJwQ1JMYU9CMG9Pb3ZsR0E5?=
 =?utf-8?B?ZnRMV0lDZkxJaHdBZWFLZUJQT04rUzd6MU9jRU5LUitiRzNFR0w2cUxycWZo?=
 =?utf-8?B?M2NzQ1FTekxTQTd1SXR1ZVNJTnJvZzhrZ0IvRlFuc2lqckNkRXJEU3hsS2p5?=
 =?utf-8?B?T1U2VytzbEhaMW1nME00QVc0Tk5GSjNKSHljMGdxeko1VE93WTFOQ1JhQ1pj?=
 =?utf-8?B?L1V1SGNURklYN3lsaFB0RjBqdkhkcklROEN6aUNRUldhcHdmYUxsTzg4TjlI?=
 =?utf-8?B?RE1oVE02ak02ayttK0dhQmNlZ2lHS1JIWGx4ZVRVTGlmdDNFQmwzQ1NtZWtN?=
 =?utf-8?B?ZTgwcytIbk53WWU1T0wxZ2NDU3IzWUExSzJTbGlrSkg4cWVpMnMvSXNWNTMx?=
 =?utf-8?B?U013RlhBL0hlSzFSbXljMmhUdm5FLzROYTRJM205RjVibkU3VjhZTFRwOXpU?=
 =?utf-8?B?bDM0eDdTUnRmaVpSWGwzUUhScHJKaWVLbklBQW13S0NCS3FMbkxEbUQ1Ymhl?=
 =?utf-8?B?RFM1RGxoUGwyQmhnWDRVUkVGZjBZMklCRGxRa3MxKzdlbGRrKzBxSWowd05D?=
 =?utf-8?B?NloxZlpZL1hJVEszVktiRXBoblZPVW80d25TbDB0L09HZk1GaldKR0pVVTVX?=
 =?utf-8?B?Q3orMWNqaldKVjNwQ083NEt4c0VlMkVPb3hwS280L0RLZW9KV1U4cko2VjhE?=
 =?utf-8?B?d3k4VUs4eVc5NFpzS2pNQlh6R0FjMksvZ0hmVXBoeTlzS3F5WUhZdmhXTWNV?=
 =?utf-8?B?MEsybUR6V0ZkaGo0RHUrNExhdHg0QkNOOFl2bUowV21qM3lYdlR5Mi8rZkU1?=
 =?utf-8?B?VDUzY2R6QXMydm1tdW8xYytFWGRQdXNCM3FsT3F1TitUSGk5cHg1UmFjZ2sx?=
 =?utf-8?B?dE5yQS9idGt4c1N2UUt5ZWxmd2NnT1FyTE44cmNQd1hDQUcxQ2g1SmEvQ2Jt?=
 =?utf-8?B?UTJBRHJvMmhpNlIyWHFxMUVlbnpRK2hDQ3lJU1dxblFFdElPSXZPZnJFS0xL?=
 =?utf-8?B?YUx0Yzk1U2JIQVcwdGJKVjA5eTc1T211YytwZEs1YWdydXJIODgvaFY0YytL?=
 =?utf-8?B?cHcrV2k1YnRKNFRvUDhUWjhHV1lkQUdHS003U3FoRTNJT2Q1UHd1aVEwSFRt?=
 =?utf-8?B?cVFuVmdKam9PdWlvc0EvbHJjdzFXSXBDQzFtY0RLanZhbXo5dVVpQWlGS3Fh?=
 =?utf-8?B?K3FNbjd5U3l5SjNKMVcwZGZEcnJEY0hKYXVqanBpc1NXU0h2SDJwTkNocTUy?=
 =?utf-8?B?UDh2dFAwYUwraDgrVHNDNEdVSmNlQStNem9DSEE3SE93MEtldmpubEVaNW9G?=
 =?utf-8?Q?UX3A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9UdUI3dFlXUUpFaHpZancyNmxNdzE0alAvMGZGVzdaWEN4SjBVaU93RzBl?=
 =?utf-8?B?TDQyZHMyU1cwTmxXUkZPM3l6MHh1clFtNldDUzh1VENMS3lnaGQzUGt6T0hV?=
 =?utf-8?B?bkN6MzdRVDUrL2JnNllEYVUwdFFGVmlWWlFlQ0ZxdFR2R2NVRVBIcmdvSG9x?=
 =?utf-8?B?Y2pkcEFFb1dFNVFtRlZZTXdrUXBFalB0MW5VWE9hWU9rUWo1RTJZYUx1cEdE?=
 =?utf-8?B?L0ZvLzNyVUxCWmtFVHNNRHlhVTVMZUE0d0tYMzNOZElLRHUyM1IxUXpZU2hC?=
 =?utf-8?B?SjlUL0N5eEFCei9LRU9pemg3dndjN0g3VXRjQTBGNG1WTlQ0NmJaa1k4TXdD?=
 =?utf-8?B?d2p4OEZNVU52UXR4WVJMOEdoWGZSUU5rajlTRnBPTGFSV0ZtRmhPQzBQZkRw?=
 =?utf-8?B?OEdUOFMxa0NrUGFzUERlUW92T3hjeG9mWEhoQXoxeXc0ZDArMStPWlE2WWRM?=
 =?utf-8?B?Y2F3NjdjK3ZXQU5jZ2lkK0NIOVRZWTlFVG9kNklVWTZ4VlgrN1pLbkdKakh4?=
 =?utf-8?B?bkxqSXJ4L0Y2dVozTGkyVnVCeWJ2U3JCakNtRm15SzN4RXpEUFZUeFZPQURt?=
 =?utf-8?B?VFk1UUFJdzVXcS80dG5UWnVMZDgrS083WktuR3d0ZkoyT0pweTRkQTVLY2Fm?=
 =?utf-8?B?VkxXeHRoR3IyVTVZMlFISzZrSVl1NTBVbmFhMCtQZjlBZzFVRisrUkZwZ3Fm?=
 =?utf-8?B?RWZpb1oxT2pKZjdxYWE0dGM4K1hJRmhiUzl0ampTKzM4VzRxb0pqWUJ3cE90?=
 =?utf-8?B?SWFOcjNFME5EZFNiS0VicUNYQUdvYWZaQnhDblgyVjZuMEpxTEZBbXRNOE9B?=
 =?utf-8?B?WEMzSTN2RkxDOGoxYTFQSWsxSWNDQThrK0Nlc3ZrU3dpNDd4a0pGSG4rTk5T?=
 =?utf-8?B?a3BrNk0yczBYYktCNG1uL3BiWmp3ZnN1aWJHRnU1d0h6R0V6UlIwWTU0eDJY?=
 =?utf-8?B?di9wQ3ArTEt2cHJLNHdFNUlQMkFqRS9kQWR6ZUMwald3WGVqNnVRL3Fkd2RJ?=
 =?utf-8?B?QkVSRkFzQUpkM3pLSld4MkZkWDFNcVFuQzRETWxhYkx2ekcvVVZYWUM5cU5N?=
 =?utf-8?B?NHBMRE9FMVJCYzh5RnlMV2xMOFNnRzJZb1V4cFFYT3dFd1ZoSklPUXdBRFBO?=
 =?utf-8?B?VDRkdEtNTTRqRldYUnIwYUdHcEtuNHlMVHdENVNpR3VEQ1BEcENhNlN3Zm4w?=
 =?utf-8?B?WFpoWjdBRkk3SzNvWTBwMzZNQnNYdlVIUGJJZlVaRzd5N2V4WStnMURlRlFn?=
 =?utf-8?B?eHRQaVJPZDhwand0QnpkOU9FSk5sMGF3aDhpcE9RYjBMQzUxU3Q4MlNJOEhI?=
 =?utf-8?B?b0txbm16cjJ3K2dpUnE2MWlETzF2eitaRGsweHdWSXNmS0MyTnJoNWhhM1ZT?=
 =?utf-8?B?bzI1eExMVzQ3NE0ySUFDSWJMa0ZveUNDSnFDTVBwdnB2QmFhdEtLcGo3ZGFs?=
 =?utf-8?B?K3JKak9FaE4xa3ErVHJKT0VUMmJuYUVVbzA4aHkyaDVxK0hSSkVBaFZTbS85?=
 =?utf-8?B?MVlPOGpVakJRdFNPQk9zOUpPQ3MvVWt2TU1lVEJ1SU0zVTFTN094b0VCN2xs?=
 =?utf-8?B?NmY1STNCd29KQmx0RlI1bGgzdHNQbHNLdUxZcUhXSjRIa3NWVmJ4OG5lZk0z?=
 =?utf-8?B?Wkh4ZGNxNjFDMUFqNWlHa3F5QTdDSnk1MGlyUmtZNmVZa3lhUHg3U1RFQTM3?=
 =?utf-8?B?MmVFSHFPa28rZEhwdTBPVGZlYnVGSzdGTTVjSXB1b2liQmE0Y2NEakxqYWFw?=
 =?utf-8?B?TStNb0lXbzFjZVhYUXkydVhjVXFoM1FTQWIyNDBKbXg1Wkptb2xLMlhCNWM4?=
 =?utf-8?B?RXp0czNlOVh1V2VQakJCNlZlVHpwSkdKaXg1MTVLcVJlR1BOUFFZdElsZ2VS?=
 =?utf-8?B?VTQ5NUs0a2dFOTRWdU1WYlRLQlk4RmNUV3ZmS1lvSmI2YWJ2M3I3TndvOVFV?=
 =?utf-8?B?ZnZpMExQRnFoZzJ5enFLbE9QOHVFNkZVTjdmQ3pvZ0MrRlFZMFJ6N0g2Nm00?=
 =?utf-8?B?dUQ1ekxDWXYrWXBNblpBNzRmdGh0WGJmNTNoeHZpYjYrSXM5bWFkQkI2dTE5?=
 =?utf-8?B?SDVxR2d3TEpCWTY4dGhPOFdiMmcwNy9nVjFvWDVrY0N5Njd0bnNWbkYrZUl4?=
 =?utf-8?B?VGNYM2ppTjVTdmNJOGZPWFIvSE1zVDJVOTlGNGEzOTBoME9nTkNqT1FYSVRq?=
 =?utf-8?B?dVhRM20zL2E3bW11WkpVQm8ybDBLZDlPb3RHSzExOXZhNDVuSWphNEprazFh?=
 =?utf-8?B?TW1nSVN6MWUrMjh6Y1gvRHhtMDlIcWxHU3YvN1VZcGRpRjFvQmNPNjEvVHpm?=
 =?utf-8?B?M0FJcUhvS0N0VzRnMjhwbURWU0M0UDhPWHptQ0QweG94S1pMOUg0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e059c122-f389-4de7-b0b8-08de5aa9e57c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:04:48.0079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBlExbzlGpRmOzm9DfTs5nO7vCjSEy7Y+5CXlGs1Wac08VYNSHT3tcJptTKtbv3/Jg5m5ydwMa9eiTYhqywYZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8753

On Fri Jan 23, 2026 at 3:09 AM GMT, John Hubbard wrote:
> On 1/13/26 6:23 PM, John Hubbard wrote:
>> On 1/13/26 5:28 AM, Gary Guo wrote:
>>> On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
>> ...
>>>> +pub(crate) struct FbRange(Range<u64>);
>>>
>>> How useful do you think this is in general? Would it make sense to have=
 a
>>> dedicated PhysAddrRange type in kernel crate that provides this feature=
?
>
> I still like this general direction.
>
>>=20
>> Pretty useful. Yes that sounds like a good move. And I see from Miguel's
>> reply that Gent Binaku (+CC) has a patch that proposes adding a=20
>> PhysAddrRange. I'll go review it in detail.
>
> (correction: PhysAddr, actually. No PhysAddrRange just yet.)=20
>
> OK, I looked into this in some detail. Based on my experience with this
> area in HMM (a linux-mm feature that deals with both CPU and GPU memory
> addresses), I'm pretty solidly convinced that PhysAddr is meant for CPU
> physical addresses.
>
> FbRange, on the other hand, is intended for VRAM (a GPU's dedicated
> memory), which is often in a separate address space. So these should not
> be the same Rust type. We'll likely want separate types for CPU, GPU
> (or "device") memory, and even DMA memory.
>
> In order to avoid seriously derailing the review of this Blackwell
> series, I'm going to continue that thought, in more detail, as part of
> my review of the PhysAddr patch [1].
>
> Meanwhile, I propose letting this aspect of this series remain as-is.

Fair. Although an always u64 type could still be useful in general, just li=
ke
drm_buddy/gpu_buddy. I would imagine some accelerator wanting things simila=
r
too.

Of course we can always have this start as Nova-specific and move out as ne=
eded.

Best,
Gary

>
>
> [1] https://lore.kernel.org/rust-for-linux/20251122055256.264180-1-binaku=
gent@gmail.com/
>
> thanks,

