Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021103.outbound.protection.outlook.com [52.101.100.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92652D3738;
	Wed, 14 Jan 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416426; cv=fail; b=Zjgl3Y3HLPbyUWV2SpF7+zu8oG5p/gAzDwlkfrIENpxT38j4Z48YjmbxMEYnvdTw9hLvb4bL35lSNpdtc4NdecpEdIVgzTktWorLCkuYZGzA9pv1BRyawIm9zItxnYhtvn/gaDOej9CV5zY7waIUxOExnzn3bTTKJvW0slYVYzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416426; c=relaxed/simple;
	bh=jRE7kl+gL7cY9tAUGOGFNEioTMT3ssmYbZE9ovCzzZo=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=mH0vz+7WBekZDP2Z3TdROYThkkcb6HBHL7dPO5N1dWNy2JdxGDSMPMe6hePG+aIgxtugoYCawiSw63yJI1GdgCzmrcMKJDDwUp8pjsHML3tD4VL9EOWWNUtCFM5YRUSbtcuaZ3Vj0TSb0aPZ1W9cuNcGfW4K5RcDoHxSHll468g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=m0q6Rd+/; arc=fail smtp.client-ip=52.101.100.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="m0q6Rd+/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5Aap66oj9vYYBeAFTyBEYNGn47DbWidaG6QhhcH/KmXG9RzIWWmKC79gy4/06XKHrgm8fZxPGM1jWNVFLr6nR6zkn1pht28/YOD5PywAXxapYCz/3tsyz45VzWq60Ej903t+2OU05xPjJpwHqRj+DAjOC50y154xGOFnXPQdIcmpMcMYXN9bT1SupUk/QAudBRbLBNvIqzEJ4FbwCfZgFuYFiq6AUW5y3acSz+Ki7d/nE5uhGoeTveBJyQc2Z+8dEwI2mRrYPonMKcIMa76T2iTWDgR0qCX+nzoRZ+v2XxTgl6znDTLKJwSN2asAzd9iMx+qGwFdkSWAjqrv0qFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qjpk5J1iRBaM8AeeTn1wNcPQTpEpOWkrc7hXPYz5NI=;
 b=LqHGnC0GYbRSuU110OwpCTqHbRpihOfq35d/VIMHlXtm6ZHuSnb6PpRl94IsPuAG4v5KwXIZJw3YsmlkyrzW2l+EZoqa0+neg9NzzBzY/7QA/A4IOWP+3mnJRC0mJkuw0Tu0pAnklyb5AzLUIT8pMPRThu9b7H4aocfIdwEG1VenM2gIgxvVkiquR3lMfLreAQepEcyiJRdkHTCBoy3HutVBSfXCf0s0hjZQYRGpsdugSgT49MgN9U0xeCTST5LEHxw0S3UUiD9lgpOYy6DmZiq9T0f0ArkGpGo6CX07S62PoW64QPmVQQMYtCbUugAze/NNKdStYeGNupk+YG0LYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qjpk5J1iRBaM8AeeTn1wNcPQTpEpOWkrc7hXPYz5NI=;
 b=m0q6Rd+/+RGAC+kbR/8ty/ruF2l9tBjgcDJtXzus4FrnRHqqgqkE9+qh4vmCGzKhFdxFaOQh+AJI2KBfUCwqaI6KuAAp0xcwDyLMjZqJrZ5pj9o920VQ9FdJOPdvOC4VCFhZvk3q5NHV/IHmz3jSzBA2VjWDaIVpSMMQpCdDd3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6520.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 18:47:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:47:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:47:00 +0000
Message-Id: <DFOJAWAGBPBD.1SKKFVK435H9O@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Alban Kurti" <kurti@invicto.ai>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 07/15] rust: pin-init: rewrite `#[pin_data]` using
 `syn`
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-8-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-8-lossin@kernel.org>
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc318c7-3029-4f97-6489-08de539d4dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTBWMExNamZ1LzkrOGo0a09wRHBxZkdESFVCcVZGTTBhS1pxVmxVUUc1RG9M?=
 =?utf-8?B?ZGdGUWpNQTRJeUtwVjVPM29YQ1NZcWp2VlVvTWdOZWFBUkx3YnpCZkdhTW90?=
 =?utf-8?B?UGN1bUdlUVpiY2M4bkJjZlg5OWhhNmVnbTVZdko3VVBKOFgxbitTVGoxK0lC?=
 =?utf-8?B?bmpvSk1ITmpRQm1KQm4rODltR0ZZRGl3amhlRXlNM2o5QkxRRjgyU2NTUWJF?=
 =?utf-8?B?SlZYTEhLWlpkcjBlUUJVU282bFc0dXlISVlnVFVDMVhMV0V0TStyeEdHKzdQ?=
 =?utf-8?B?OGIyNk1lVkZQdDZ1bnBybDZxWDhjQTlkYUR1TDNBYXgvdUhlY2FCUFJYeWFl?=
 =?utf-8?B?YUcxMzhqMjFNVFJDOTNKMlVKcVU0YjMrNHdtQmNHenBiTGp2MDdFNjNuRE9X?=
 =?utf-8?B?L0NEaWR4QUdtM1NMUUlOcVBsaUN2NnJWcWlPMk8vdERWb0RZVzRqYWFBVUFi?=
 =?utf-8?B?aXh6RVR2Q2gwcmh2MWlkRnp0OGhSdnhKbmhyaXNoankzMVNhQ2dpN1FQTktR?=
 =?utf-8?B?c09ZRWRIbDU3cy9RSE1tU2NQRGNTWmlGaWM3KzV6RE9WYUxsajRqY2Z5TFBT?=
 =?utf-8?B?WmpaWmZwT1NsWTUxQVhoZGQrdWVRKzFWcTAvL2YvTUtKWmxZUzRvT0hlekZ6?=
 =?utf-8?B?azErdjF0K3ZCaW90UlZlZmtDT0ZFUmZTdHIrVWNjTVBjV2tCOTBhN1RxSGhz?=
 =?utf-8?B?R2QvTDRvYUFKSG5mWWVBV3ZvM2hOV0JYWVArdGRVd1BMblZ0L1RlYmdIVU9P?=
 =?utf-8?B?Qm9sK1oyRURTVzhSQXZaMDFEejRYZU04c1dGUHBlbkVOYlp3T0U4R3JWRG1u?=
 =?utf-8?B?WExGM3VnNjdERHI3S0VwenF2UHA0RUd1Ymd6QzRTdjcrUzIvZDhHUFM2K1py?=
 =?utf-8?B?VWJGcWNMSDRlK254eDhrYy9vWm5uZjlnNFlxSmlCdU9JWkJNVTBZeEV3UDNW?=
 =?utf-8?B?ZnhvRFdqbWorVUlmQmx5MXM1cDhiZ2RCNTVCM3gzc09oNFZNUW9WVXMzaUoz?=
 =?utf-8?B?b09xeVBuYUxWYUZvRFpQdDczS1lZYUJXT2dCTGhZSlpjYXpCNVorN1hMUGVN?=
 =?utf-8?B?RzRVbExycmpIYk5nOW5weThmMXdEeWNaUFJRNzdxczFKNmpON1k3UkxMdEg0?=
 =?utf-8?B?YWZWMTNUZWNYV2pibklaS3NmVGJvOU03Wnp4UFBXbnR2QWlQdUY0VFFKbmk1?=
 =?utf-8?B?Z2NqL0tqb2dMQUthbS9PZjcvaVpVUEZGY1ZTSVVwQjY5bjZ1Q21xNTc3TGdJ?=
 =?utf-8?B?dzRKZzN2bHloWFlMNWliREtDZ056YlJCQ0VFZTF4SHFEV0xNb0g0UmNZZ1Ju?=
 =?utf-8?B?blpqdnZkRTBXVHU5ZHBZTDhUcFg1UmxLYkV5U21UWTVmNCt1d2JidlVIQWZK?=
 =?utf-8?B?dlY2SmQ4MllFVlRVS2dMNjI1d216SThHOUhXRUllV0tjclYrSlVKN1kzNUNU?=
 =?utf-8?B?TzJuTGUrY0IvQ1ZaK1pJQ1h3Q2cxTnNaa3VOZWdIN3FlL1VXM2JRWEJiUkdH?=
 =?utf-8?B?V3cwUE1kU24zUE1aTlBSVUZpaXl0SG1HV1h0Z29wSWprZmE2eTNPTXB0NytQ?=
 =?utf-8?B?c3pTZEJ0M0lYZExtZmV3SXhmUTdrY2wzamNBQ0Eyejh5WE41RmZBY09BRThF?=
 =?utf-8?B?TDUyNkdvdVdBK01sOHVGUVhmbjFrNjZYY0J6dDI2RCtvVjJnL1hqcmk4OXQy?=
 =?utf-8?B?M2RXZGlERktqazdFUllpaEpIRjJOZEV2ek1INk9hZmM5STRqODlJbjhnb1Zl?=
 =?utf-8?B?Z0lOTHZ4QzUwQ3FXQ2t2WXI0d1hQemtpOGpiTWtLZ3V1UkdqcHpsTjF5Ulpo?=
 =?utf-8?B?ZUFIbFBpaDh1ZlQvcHBaR1Z4eFpPUldYRVpFSUZPSFNQM05ld2RyQ3pZdHdr?=
 =?utf-8?B?RkxNZjhDYkhjU2QySjR4QWtRQnJPTTVLWElhRzNrMjk3TnVlL0dZaVVWbmc5?=
 =?utf-8?B?Y1h3NHdLOHNsTEppbzREUHF6TmNidHFST2xLNmgranBoNHR4bzJ3bjVOR2Z4?=
 =?utf-8?B?VzZhZlF4alZKN2lkQWhwR1QyRlhXajhNc0UxVC9iMmEzTjN6M1BubDFZSzJJ?=
 =?utf-8?B?TXRDeDVxL2daRkNDTFBpYW91UEZCLzIyZzliSDRoTnRDNmV3VnpENDMvQ21H?=
 =?utf-8?B?WmlIUlNhN1VkNGtVTmRwWnF4TEVKUHZlS2xLS3pVQ0ZURTRENzQ2c0toWUJk?=
 =?utf-8?B?ZUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wit1VGxlSmUxQjBXZWpKdkpFNHV5eEdoclZJblF6TXRuYWp1OFAxOXlnWTN2?=
 =?utf-8?B?RGY3MzFmTm11ZDkxbWZ1Sk5sbHNjQUxCNnVPV3ZscGx4N2REV0VCWHdDeWhN?=
 =?utf-8?B?S1g2RHIwVDZuaWdzaWFyUFNJazgyaE0xbm5qS0dDNXZQZVl5cnFoWXpGTHlC?=
 =?utf-8?B?QVVpd0tQek9YSHkzdHQ0TDV1bW81Y2xWT0krSktDUXgwT2ZMQmwxZjF4dUw0?=
 =?utf-8?B?ZnYxaGlmUnp4WFRYaHdBd1BDS0dXVDY1MEo5d2h0eEQzV2hTR21UVnp1RmJQ?=
 =?utf-8?B?R1FZVGo0MlJzSzB4d3FOZTNOSnp1cU4xY0hRSjRENVJtRzRyMXFhaFA3N3lQ?=
 =?utf-8?B?SVFCMVd0M2hiZ0pLYk9NVWpOMUY3UC9XSEtKRU9aQlhOMmNBUUN1N0pJWlkw?=
 =?utf-8?B?ZFA3Qjc0bEdJamJGelJOVkRBWXRLem9IYUI3TTVUU0tVcS9vZTZXRHZTazNj?=
 =?utf-8?B?elZIeHM0cHdnd2lDV0Y0a2VpTXhRbUZHTU50NkFVcm9JUnBmb3RKeGt0dUVE?=
 =?utf-8?B?VVFuRUVVaThRZlZxTVVESWpwZys2OXJPM2dnQjVFanNqNS9SMHV3dHNLRElh?=
 =?utf-8?B?aDZmNjZlK0czeXRWREh2RGVvbkY4dnU0cloyc3ZsTzZVdGkrbjQyMVRLY2d3?=
 =?utf-8?B?TllCcUJWM1pPenNmZDA5dGl6bzRTbmtxL0RRUTBVWmxBM2hzQlR5ZXpqc2pR?=
 =?utf-8?B?WWIrNU5jY2hIWEx1WFB0YlJhaDJzeGkyM05lMTRXUHExZUl5eG95MWVEd1JY?=
 =?utf-8?B?RDY1UGNvUXUzVVh5b0RrN1g4akRFYlJiKzBFNlI5RG5MUVBjbllmbVlHdUVW?=
 =?utf-8?B?eXd2a2U1YmF3UWNxd1QvM2l4S1hqTUFqZ3FFeDlydzJIck1Ma3ZCdWdOUVY1?=
 =?utf-8?B?VzNaUDVqaWFmbzNTekVkUmkrbUI4bWZ5eXJyYzJnZlFEbXNsMGRKWGllQ0k3?=
 =?utf-8?B?Q0VIeVNtY1N3bkNQd3daNVlFZTcxVVorRG9NQVE3bDZBYXcrYXBRK0VVc1Fz?=
 =?utf-8?B?WXBGcjBGNXo4VEMwSU9rZGgxMDJOYzRRWkVJWGRnSmhiTU1rMG5PWWptRlZS?=
 =?utf-8?B?MjJoUHpMdGVpZWVndjZPdTFreWkrRGZmQzNBTU45RlVjR0haQ2hLU00wbjdS?=
 =?utf-8?B?WHRYVUlaUTkrbFJiWEhBa1ZDdkRucEdYSjNBMUVESjNjSjZlSCsyaGNsZ0xE?=
 =?utf-8?B?aU11c2o5V1J3S1JEMGJQdUl2MGtxcVNQQzNsVm5tTDRyOU9XQVFMN2poUkZJ?=
 =?utf-8?B?dmtGdWIzL0RTR3YrZmhQWmp4Mk96VVJ6SFNZWHkwZEF0dkZnaFlrRGcxNElo?=
 =?utf-8?B?a2k3OVgvajhqOE0yR0l2a0F6aFh4YnJ4bnZHaDFFWEVaYWlMMEFrMy9JZWVu?=
 =?utf-8?B?cENxYjZJTVhDQUMzTURFeGtwOFBwZGFGbzZCRU5QY2pMeTVkQzVTVVE0REx2?=
 =?utf-8?B?WE1IRnBBdWtlQ3B4S1hwS0FHRjdQRDF1R203QXhyNGQ3K284RUFKSFVPY0lC?=
 =?utf-8?B?YW5mMWZaQ29FUkI4dG5aRjVCUno3TEFlM1NPdVRySVJXZ25pZXUxUnJWS25u?=
 =?utf-8?B?c2NHeHo5VWJ4N2tSNS9xVWMwaTBuWG9VRGtKQldsMndxMWFFYTQ5YzN5QUoz?=
 =?utf-8?B?cW5IQXBBek1oZ3h6M2VjQ3FaU0VQdEFCRG9Bc0dKb1laMTIzVW9XblRnb0FO?=
 =?utf-8?B?aEtqMmkvV05PTjJyZ1dWby9PNFlQOWRkYnYzWHA1TWlKWGplS1hKdm5nMHpK?=
 =?utf-8?B?RkNQQWhudXcwNE4wRWdValozdlRmSGpSTDNnQlpJM1FtaWZXZEFFVWVqSXpL?=
 =?utf-8?B?aUxtQWVUWkZVcFBQUVNGai8xVWQ0QTg0WnBTdHU4NFFiKzd5eGdoMlZUWnYw?=
 =?utf-8?B?YzIvVjJQTGtTSWlvclpHdCtieFM4MG9JTjc1U1BCeFN5aWM2SXY5OTJvVTF5?=
 =?utf-8?B?Z0lwa0RyRDEvMzYwVUtzY2s5RlF6d0M5ajY4K0NCZGJUcGc5Y2prMFhFbFIx?=
 =?utf-8?B?Z2V0VWpwNjBTbDVINzZ5N0U0Z0QvQjA1NnN4TlNha0RDK04xQmo5anlzMzBQ?=
 =?utf-8?B?ZkpyM2ppeDlnNTFPKy9HaW9obDlvV3dVNUdaOUViRElWbjZ3TU5veGNIa2ph?=
 =?utf-8?B?R3pQOHRXZVpqVGdYNVNzUk9wNDB3VUtrOFdLb1JpMER0VEpWV0d5RUh1Z1FJ?=
 =?utf-8?B?b3JvQzFnQTVUdmx2eTBHS0w4My93RU1VcGNxWFBQVUVIV1Qxd2F6Vkw4SDd6?=
 =?utf-8?B?ZUtPMDVyMlphL21VTmwwSEp0YWlwbk9vYUtUdGM2MnN5c1FJQUNSN1JOZGRp?=
 =?utf-8?B?UE9yMzZqYWM1S2dCR0tuUXc4eTZLUU1yanZSUCtmcTgvWllhR1BoZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc318c7-3029-4f97-6489-08de539d4dbf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:47:01.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f11gFcas8dG9O0JsZD5OP0vM+H7bcNX+cxgv3Vk7aHOI/eLREU93CQP1fEg5PHni9iBwB14AZVZEeOlJL690A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6520

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> Rewrite the attribute macro `#[pin_data]` using `syn`. No functional
> changes intended aside from improved error messages on syntactic and
> semantical errors. For example if one forgets a comma at the end of a
> field:
>
>     #[pin_data]
>     struct Foo {
>         a: Box<Foo>
>         b: Box<Foo>
>     }
>
> The declarative macro reports the following errors:
>
>     error: expected `,`, or `}`, found `b`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
>       |
>     5 |     a: Box<Foo>
>       |                ^ help: try adding a comma: `,`
>
>     error: recursion limit reached while expanding `$crate::__pin_data!`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:3:1
>       |
>     3 | #[pin_data]
>       | ^^^^^^^^^^^
>       |
>       =3D help: consider increasing the recursion limit by adding a `#![r=
ecursion_limit =3D "256"]` attribute to your crate (`$CRATE`)
>       =3D note: this error originates in the macro `$crate::__pin_data` w=
hich comes from the expansion of the attribute macro `pin_data` (in Nightly=
 builds, run with -Z macro-backtrace for more info)
>
> The new `syn` version reports:
>
>     error: expected `,`, or `}`, found `b`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
>       |
>     5 |     a: Box<Foo>
>       |                ^ help: try adding a comma: `,`
>
>     error: expected `,`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:6:5
>       |
>     6 |     b: Box<Foo>
>       |     ^
>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> Changes in v3:
> * use DiagCtxt error handling
> Changes in v2:
> * improved error handling
> * fix clippy warnings
> * fix typos and variable names
> * collect the information about the pinned/not pinned fields only once
>   at the beginning
> ---
>  rust/pin-init/internal/src/helpers.rs  | 149 ------
>  rust/pin-init/internal/src/lib.rs      |   7 +-
>  rust/pin-init/internal/src/pin_data.rs | 633 ++++++++++++++++++++-----
>  rust/pin-init/src/macros.rs            | 574 ----------------------
>  4 files changed, 525 insertions(+), 838 deletions(-)
>  delete mode 100644 rust/pin-init/internal/src/helpers.rs
>
> diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/inter=
nal/src/pin_data.rs
> index 86a53b37cc66..fb4b8507c01d 100644
> --- a/rust/pin-init/internal/src/pin_data.rs
> +++ b/rust/pin-init/internal/src/pin_data.rs
> @@ -1,126 +1,535 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
> =20
> -use crate::helpers::{parse_generics, Generics};
> -use proc_macro2::{Group, Punct, Spacing, TokenStream, TokenTree};
> -use quote::quote;
> +use proc_macro2::TokenStream;
> +use quote::{format_ident, quote};
> +use syn::{
> +    parse::{End, Nothing, Parse},
> +    parse_quote, parse_quote_spanned,
> +    spanned::Spanned,
> +    visit_mut::VisitMut,
> +    Field, Generics, Ident, Item, PathSegment, Type, TypePath, Visibilit=
y, WhereClause,
> +};
> =20
> -pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenSt=
ream {
> -    // This proc-macro only does some pre-parsing and then delegates the=
 actual parsing to
> -    // `pin_init::__pin_data!`.
> +use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
> =20
> -    let (
> -        Generics {
> -            impl_generics,
> -            decl_generics,
> -            ty_generics,
> -        },
> -        rest,
> -    ) =3D parse_generics(input);
> -    // The struct definition might contain the `Self` type. Since `__pin=
_data!` will define a new
> -    // type with the same generics and bounds, this poses a problem, sin=
ce `Self` will refer to the
> -    // new type as opposed to this struct definition. Therefore we have =
to replace `Self` with the
> -    // concrete name.
> -
> -    // Errors that occur when replacing `Self` with `struct_name`.
> -    let mut errs =3D TokenStream::new();
> -    // The name of the struct with ty_generics.
> -    let struct_name =3D rest
> -        .iter()
> -        .skip_while(|tt| !matches!(tt, TokenTree::Ident(i) if i =3D=3D "=
struct"))
> -        .nth(1)
> -        .and_then(|tt| match tt {
> -            TokenTree::Ident(_) =3D> {
> -                let tt =3D tt.clone();
> -                let mut res =3D vec![tt];
> -                if !ty_generics.is_empty() {
> -                    // We add this, so it is maximally compatible with e=
.g. `Self::CONST` which
> -                    // will be replaced by `StructName::<$generics>::CON=
ST`.
> -                    res.push(TokenTree::Punct(Punct::new(':', Spacing::J=
oint)));
> -                    res.push(TokenTree::Punct(Punct::new(':', Spacing::A=
lone)));
> -                    res.push(TokenTree::Punct(Punct::new('<', Spacing::A=
lone)));
> -                    res.extend(ty_generics.iter().cloned());
> -                    res.push(TokenTree::Punct(Punct::new('>', Spacing::A=
lone)));
> -                }
> -                Some(res)
> +pub(crate) mod kw {
> +    syn::custom_keyword!(PinnedDrop);
> +}
> +
> +pub(crate) enum Args {
> +    Nothing(Nothing),
> +    #[allow(dead_code)]
> +    PinnedDrop(kw::PinnedDrop),
> +}
> +
> +impl Parse for Args {
> +    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
> +        let lh =3D input.lookahead1();
> +        if lh.peek(End) {
> +            input.parse().map(Self::Nothing)
> +        } else if lh.peek(kw::PinnedDrop) {
> +            let res =3D input.parse().map(Self::PinnedDrop)?;
> +            let lh =3D input.lookahead1();
> +            if lh.peek(End) {
> +                Ok(res)
> +            } else {
> +                Err(lh.error())
>              }

I believe that this `End` peek is unnecessary?

> -            _ =3D> None,
> +        } else {
> +            Err(lh.error())
> +        }
> +    }
> +}
> +
> +pub(crate) fn pin_data(
> +    args: Args,
> +    input: Item,
> +    dcx: &mut DiagCtxt,
> +) -> Result<TokenStream, ErrorGuaranteed> {
> +    let mut struct_ =3D match input {
> +        Item::Struct(struct_) =3D> struct_,
> +        Item::Enum(enum_) =3D> {
> +            return Err(dcx.error(
> +                enum_.enum_token,
> +                "`#[pin_data]` only supports structs for now",
> +            ));
> +        }
> +        Item::Union(union) =3D> {
> +            return Err(dcx.error(
> +                union.union_token,
> +                "`#[pin_data]` only supports structs for now",
> +            ));
> +        }
> +        rest =3D> {
> +            return Err(dcx.error(
> +                rest,
> +                "`#[pin_data]` can only be applied to struct, enum and u=
nion definitions",
> +            ));
> +        }
> +    };
> +
> +    // The generics might contain the `Self` type. Since this macro will=
 define a new type with the
> +    // same generics and bounds, this poses a problem: `Self` will refer=
 to the new type as opposed
> +    // to this struct definition. Therefore we have to replace `Self` wi=
th the concrete name.
> +    let mut replacer =3D {
> +        let name =3D &struct_.ident;
> +        let (_, ty_generics, _) =3D struct_.generics.split_for_impl();
> +        SelfReplacer(parse_quote!(#name #ty_generics))
> +    };
> +    replacer.visit_generics_mut(&mut struct_.generics);
> +    replacer.visit_fields_mut(&mut struct_.fields);
> +
> +    let fields: Vec<(bool, Field)> =3D struct_
> +        .fields
> +        .iter()
> +        .cloned()
> +        .map(|mut field| {
> +            let pinned =3D is_field_structurally_pinned(&field);

There is only one occurance now so you can just check if a field is pinned =
by
looking at if `field.attrs.len()` is changed the line below (see my syn ser=
ies
where Tamir and I had some discussion about something similar).

> +            field.attrs.retain(|a| !a.path().is_ident("pin"));
> +            (pinned, field)
>          })
> -        .unwrap_or_else(|| {
> -            // If we did not find the name of the struct then we will us=
e `Self` as the replacement
> -            // and add a compile error to ensure it does not compile.
> -            errs.extend(
> -                "::core::compile_error!(\"Could not locate type name.\")=
;"
> -                    .parse::<TokenStream>()
> -                    .unwrap(),
> +        .collect();
> +
> +    for (pinned, field) in &fields {
> +        if !pinned && is_phantom_pinned(&field.ty) {
> +            dcx.error(
> +                field,
> +                format!(
> +                    "The field `{}` of type `PhantomPinned` only has an =
effect \
> +                    if it has the `#[pin]` attribute",
> +                    field.ident.as_ref().unwrap(),
> +                ),
>              );
> -            "Self".parse::<TokenStream>().unwrap().into_iter().collect()
> -        });
> -    let impl_generics =3D impl_generics
> -        .into_iter()
> -        .flat_map(|tt| replace_self_and_deny_type_defs(&struct_name, tt,=
 &mut errs))
> -        .collect::<Vec<_>>();
> -    let mut rest =3D rest
> -        .into_iter()
> -        .flat_map(|tt| {
> -            // We ignore top level `struct` tokens, since they would emi=
t a compile error.
> -            if matches!(&tt, TokenTree::Ident(i) if i =3D=3D "struct") {
> -                vec![tt]
> -            } else {
> -                replace_self_and_deny_type_defs(&struct_name, tt, &mut e=
rrs)
> +        }
> +    }
> +
> +    let unpin_impl =3D generate_unpin_impl(&struct_.ident, &struct_.gene=
rics, &fields);
> +    let drop_impl =3D generate_drop_impl(&struct_.ident, &struct_.generi=
cs, args);
> +    let projections =3D
> +        generate_projections(&struct_.vis, &struct_.ident, &struct_.gene=
rics, &fields);
> +    let the_pin_data =3D
> +        generate_the_pin_data(&struct_.vis, &struct_.ident, &struct_.gen=
erics, &fields);
> +
> +    strip_pin_annotations(&mut struct_);

I think this can be removed if you clone the fields after the `retain` -- o=
r
even better, just avoid the clone of fields.

> +
> +    Ok(quote! {
> +        #struct_
> +        #projections
> +        // We put the rest into this const item, because it then will no=
t be accessible to anything
> +        // outside.
> +        const _: () =3D {
> +            #the_pin_data
> +            #unpin_impl
> +            #drop_impl
> +        };
> +    })
> +}
> +
> +fn is_phantom_pinned(ty: &Type) -> bool {
> +    match ty {
> +        Type::Path(TypePath { qself: None, path }) =3D> {
> +            // Cannot possibly refer to `PhantomPinned` (except alias, b=
ut that's on the user).
> +            if path.segments.len() > 3 {
> +                return false;
>              }
> -        })
> -        .collect::<Vec<_>>();
> -    // This should be the body of the struct `{...}`.
> -    let last =3D rest.pop();
> -    let mut quoted =3D quote!(::pin_init::__pin_data! {
> -        parse_input:
> -        @args(#args),
> -        @sig(#(#rest)*),
> -        @impl_generics(#(#impl_generics)*),
> -        @ty_generics(#(#ty_generics)*),
> -        @decl_generics(#(#decl_generics)*),
> -        @body(#last),
> -    });
> -    quoted.extend(errs);
> -    quoted
> +            // If there is a `::`, then the path needs to be `::core::ma=
rker::PhantomPinned` or
> +            // `::std::marker::PhantomPinned`.
> +            if path.leading_colon.is_some() && path.segments.len() !=3D =
3 {
> +                return false;
> +            }
> +            let expected: Vec<&[&str]> =3D vec![&["PhantomPinned"], &["m=
arker"], &["core", "std"]];
> +            for (actual, expected) in path.segments.iter().rev().zip(exp=
ected) {
> +                if !actual.arguments.is_empty() || expected.iter().all(|=
e| actual.ident !=3D e) {
> +                    return false;
> +                }
> +            }
> +            true
> +        }
> +        _ =3D> false,
> +    }
>  }
> =20
> -/// Replaces `Self` with `struct_name` and errors on `enum`, `trait`, `s=
truct` `union` and `impl`
> -/// keywords.
> -///
> -/// The error is appended to `errs` to allow normal parsing to continue.
> -fn replace_self_and_deny_type_defs(
> -    struct_name: &Vec<TokenTree>,
> -    tt: TokenTree,
> -    errs: &mut TokenStream,
> -) -> Vec<TokenTree> {
> -    match tt {
> -        TokenTree::Ident(ref i)
> -            if i =3D=3D "enum" || i =3D=3D "trait" || i =3D=3D "struct" =
|| i =3D=3D "union" || i =3D=3D "impl" =3D>
> +fn is_field_structurally_pinned(field: &Field) -> bool {
> +    field.attrs.iter().any(|a| a.path().is_ident("pin"))
> +}
> +
> +fn generate_unpin_impl(
> +    ident: &Ident,
> +    generics: &Generics,
> +    fields: &[(bool, Field)],
> +) -> TokenStream {
> +    let generics_with_pin_lt =3D {
> +        let mut g =3D generics.clone();
> +        g.params.insert(0, parse_quote!('__pin));
> +        let _ =3D g.make_where_clause();
> +        g
> +    };
> +    let (
> +        impl_generics_with_pin_lt,
> +        ty_generics_with_pin_lt,
> +        Some(WhereClause {
> +            where_token,
> +            predicates,
> +        }),
> +    ) =3D generics_with_pin_lt.split_for_impl()
> +    else {
> +        unreachable!()
> +    };
> +    let (_, ty_generics, _) =3D generics.split_for_impl();
> +    let pinned_fields =3D fields.iter().filter_map(|(b, f)| b.then_some(=
f));
> +    quote! {
> +        // This struct will be used for the unpin analysis. It is needed=
, because only structurally
> +        // pinned fields are relevant whether the struct should implemen=
t `Unpin`.
> +        #[allow(dead_code)] // The fields below are never used.
> +        struct __Unpin #generics_with_pin_lt
> +        #where_token
> +            #predicates
>          {
> -            errs.extend(
> -                format!(
> -                    "::core::compile_error!(\"Cannot use `{i}` inside of=
 struct definition with \
> -                        `#[pin_data]`.\");"
> +            __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) ->=
 &'__pin ()>,
> +            __phantom: ::core::marker::PhantomData<
> +                fn(#ident #ty_generics) -> #ident #ty_generics
> +            >,
> +            #(#pinned_fields),*
> +        }
> +
> +        #[doc(hidden)]
> +        impl #impl_generics_with_pin_lt ::core::marker::Unpin for #ident=
 #ty_generics
> +        #where_token
> +            __Unpin #ty_generics_with_pin_lt: ::core::marker::Unpin,
> +            #predicates
> +        {}
> +    }
> +}
> +
> +fn generate_drop_impl(ident: &Ident, generics: &Generics, args: Args) ->=
 TokenStream {
> +    let (impl_generics, ty_generics, whr) =3D generics.split_for_impl();
> +    let has_pinned_drop =3D matches!(args, Args::PinnedDrop(_));
> +    // We need to disallow normal `Drop` implementation, the exact behav=
ior depends on whether
> +    // `PinnedDrop` was specified in `args`.
> +    if has_pinned_drop {
> +        // When `PinnedDrop` was specified we just implement `Drop` and =
delegate.
> +        quote! {
> +            impl #impl_generics ::core::ops::Drop for #ident #ty_generic=
s
> +                #whr
> +            {
> +                fn drop(&mut self) {
> +                    // SAFETY: Since this is a destructor, `self` will n=
ot move after this function
> +                    // terminates, since it is inaccessible.
> +                    let pinned =3D unsafe { ::core::pin::Pin::new_unchec=
ked(self) };
> +                    // SAFETY: Since this is a drop function, we can cre=
ate this token to call the
> +                    // pinned destructor of this type.
> +                    let token =3D unsafe { ::pin_init::__internal::OnlyC=
allFromDrop::new() };
> +                    ::pin_init::PinnedDrop::drop(pinned, token);
> +                }
> +            }
> +        }
> +    } else {
> +        // When no `PinnedDrop` was specified, then we have to prevent i=
mplementing drop.
> +        quote! {
> +            // We prevent this by creating a trait that will be implemen=
ted for all types implementing
> +            // `Drop`. Additionally we will implement this trait for the=
 struct leading to a conflict,
> +            // if it also implements `Drop`
> +            trait MustNotImplDrop {}
> +            #[expect(drop_bounds)]
> +            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
> +            impl #impl_generics MustNotImplDrop for #ident #ty_generics
> +                #whr
> +            {}
> +            // We also take care to prevent users from writing a useless=
 `PinnedDrop` implementation.
> +            // They might implement `PinnedDrop` correctly for the struc=
t, but forget to give
> +            // `PinnedDrop` as the parameter to `#[pin_data]`.
> +            #[expect(non_camel_case_types)]
> +            trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {=
}
> +            impl<T: ::pin_init::PinnedDrop>
> +                UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for=
 T {}
> +            impl #impl_generics
> +                UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for=
 #ident #ty_generics
> +                #whr
> +            {}
> +        }
> +    }
> +}
> +
> +fn generate_projections(
> +    vis: &Visibility,
> +    ident: &Ident,
> +    generics: &Generics,
> +    fields: &[(bool, Field)],
> +) -> TokenStream {
> +    let (impl_generics, ty_generics, _) =3D generics.split_for_impl();
> +    let mut generics =3D generics.clone();
> +    generics.params.insert(0, parse_quote!('__pin));
> +    let (_, ty_generics_with_pin_lt, whr) =3D generics.split_for_impl();

This part uses split-modify-split while `generate_unpin_impl` uses
clone-then-split. I am fine with either but please make them consistent.

Best,
Gary

> +    let projection =3D format_ident!("{ident}Projection");
> +    let this =3D format_ident!("this");
> +
> +    let (fields_decl, fields_proj) =3D collect_tuple(fields.iter().map(
> +        |(
> +            pinned,
> +            Field {
> +                vis,
> +                ident,
> +                ty,
> +                attrs,
> +                ..
> +            },
> +        )| {
> +            let mut attrs =3D attrs.clone();
> +            attrs.retain(|a| !a.path().is_ident("pin"));
> +            let mut no_doc_attrs =3D attrs.clone();
> +            no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
> +            let ident =3D ident
> +                .as_ref()
> +                .expect("only structs with named fields are supported");
> +            if *pinned {
> +                (
> +                    quote!(
> +                        #(#attrs)*
> +                        #vis #ident: ::core::pin::Pin<&'__pin mut #ty>,
> +                    ),
> +                    quote!(
> +                        #(#no_doc_attrs)*
> +                        // SAFETY: this field is structurally pinned.
> +                        #ident: unsafe { ::core::pin::Pin::new_unchecked=
(&mut #this.#ident) },
> +                    ),
>                  )
> -                .parse::<TokenStream>()
> -                .unwrap()
> -                .into_iter()
> -                .map(|mut tok| {
> -                    tok.set_span(tt.span());
> -                    tok
> -                }),
> -            );
> -            vec![tt]
> -        }
> -        TokenTree::Ident(i) if i =3D=3D "Self" =3D> struct_name.clone(),
> -        TokenTree::Literal(_) | TokenTree::Punct(_) | TokenTree::Ident(_=
) =3D> vec![tt],
> -        TokenTree::Group(g) =3D> vec![TokenTree::Group(Group::new(
> -            g.delimiter(),
> -            g.stream()
> -                .into_iter()
> -                .flat_map(|tt| replace_self_and_deny_type_defs(struct_na=
me, tt, errs))
> -                .collect(),
> -        ))],
> +            } else {
> +                (
> +                    quote!(
> +                        #(#attrs)*
> +                        #vis #ident: &'__pin mut #ty,
> +                    ),
> +                    quote!(
> +                        #(#no_doc_attrs)*
> +                        #ident: &mut #this.#ident,
> +                    ),
> +                )
> +            }
> +        },
> +    ));
> +    let structurally_pinned_fields_docs =3D fields
> +        .iter()
> +        .filter_map(|(pinned, field)| pinned.then_some(field))
> +        .map(|Field { ident, .. }| format!(" - `{}`", ident.as_ref().unw=
rap()));
> +    let not_structurally_pinned_fields_docs =3D fields
> +        .iter()
> +        .filter_map(|(pinned, field)| (!pinned).then_some(field))
> +        .map(|Field { ident, .. }| format!(" - `{}`", ident.as_ref().unw=
rap()));
> +    let docs =3D format!(" Pin-projections of [`{ident}`]");
> +    quote! {
> +        #[doc =3D #docs]
> +        #[allow(dead_code)]
> +        #[doc(hidden)]
> +        #vis struct #projection #generics {
> +            #(#fields_decl)*
> +            ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut=
 ()>,
> +        }
> +
> +        impl #impl_generics #ident #ty_generics
> +            #whr
> +        {
> +            /// Pin-projects all fields of `Self`.
> +            ///
> +            /// These fields are structurally pinned:
> +            #(#[doc =3D #structurally_pinned_fields_docs])*
> +            ///
> +            /// These fields are **not** structurally pinned:
> +            #(#[doc =3D #not_structurally_pinned_fields_docs])*
> +            #[inline]
> +            #vis fn project<'__pin>(
> +                self: ::core::pin::Pin<&'__pin mut Self>,
> +            ) -> #projection #ty_generics_with_pin_lt {
> +                // SAFETY: we only give access to `&mut` for fields not =
structurally pinned.
> +                let #this =3D unsafe { ::core::pin::Pin::get_unchecked_m=
ut(self) };
> +                #projection {
> +                    #(#fields_proj)*
> +                    ___pin_phantom_data: ::core::marker::PhantomData,
> +                }
> +            }
> +        }
> +    }
> +}
