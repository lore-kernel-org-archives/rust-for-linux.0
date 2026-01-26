Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF2530E82C;
	Mon, 26 Jan 2026 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413543; cv=fail; b=MCY224uXUwuDF8B2wzyla8+RyHsAmtxGreS9+/vjo9L4mUl0hK+QmuTghr6vLxn1lkKIX2mgqGwaRVSVR5HbQxF3WsatqPA5DZB4mbhuTxaNQ9fXV4l2EFtQBJBVxIhMcvBkTj4ocSs1MerZbI/zSrYa0mSB8mswaOwjOcfvpeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413543; c=relaxed/simple;
	bh=vjHuo+IjYGbFjYODGG8MGGH1OOaJFTgk37QjO3DFaxw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KPXQcOCnh0lkCTaQ3toxM+7+b64cRfMW1izXPL0WRvmgs1UdiQECrHLhEcS1lc4FX7gfbt6DXF6b1vKAV4ticspsihBB/+VEjL2tOnLuK7MexpG9S0Hwb/Ju2UKhuYVq7T1tP3WgJK+Ixzkj4/Xa5AnuhbHnjvvHi3dAN9hYzDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kZSkYXNZ; arc=fail smtp.client-ip=40.93.195.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kZSkYXNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piTNI/h4NAGOa7nfmLR6L2Au21nsDOg1SULb8aozicoxunUQJjn2cZmIRAqdoGmgaCiKEh99zSb6JAXj1DRsIDu5nNvO145bf8yFUo7KLnGXfPFMcOOICXBfbAQ5LBOy3sIHINMRv0vOVTqVy3/NpNIndsE2KlD8PMEbkOJos8IHe5WF2nqQlACPzeUVrLkRxEMnH9cackEmRrlJ/mvLNR9EjzzpL8Bh1lj0um0SP1kP9hijCDhcajZ2rSD2M1vMKw/6OvcgYwZ8UOzDrQaz8XsR6jFlvm21ce1GdQp2kpIAAoJgB34OQYSCqCCUmrFJoUeOvVLgGyQ1KVHoa0uhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+99NI+lxV+HjUD5tD7BMat3tcFVGfwyAyxV5Rx8jvg=;
 b=HoTjlE/yDpQdMFbW3jQTRlnLL29i0XrGedtZ7kfriZlDoPm3ridb3/BuSB5YLJmxYN+zyEKDzCqSnU/TR7MrtAROk48k+XX1NkIpxz8J5G7vhg2FqJ3cY7l7xx9VEjeXB6wcXHU/4clElLAR9bHA37X1dWZ1lqDaWWTuBys4o3rebow4q74d5zcDHWVUp9w7Agdpuc0fsdzZSvWP4CNnMD2Cd9h+5Def2643FcDS9Dl/pGf2kOQeNsRlwAKRG15penmvfLVO/J7Rmeaym2iJfZpl6WxMWsAJ/xrAEuGXOAIyYbf/PlUraBijWhkST1cVB6I2nJrIsyXMenlrkTPVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+99NI+lxV+HjUD5tD7BMat3tcFVGfwyAyxV5Rx8jvg=;
 b=kZSkYXNZuhjzEcFb7VF+QbDNI261QedZ8yFsZGvz0hF3MTwftuKGfDIP/rHryFerrvBocKWvPFBGeXkbySpvkD3pPe0goyc9UF/wMqpAkqxoQ0siQ0N5wgc0G2g1oEf8naaqIW3zwBYVLEea7kddNOk3bPocyIBawSRaCAhq6h6zPXXGDK5KZIfq3K/N/NH4Zj03hflRpvveB6wdtIdcXzeScWFrzRwhydv3orKKRfVR9PvruSTYu6+g81FDPBGxTtnm759sFxQUukCvhYWwJPTYpdIBA8k8x2RSxYoHeMby6qkHBZWjynd+7DgcHgUZ458mPSWcE4y93hF7hpfj4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 07:45:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 07:45:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 16:45:34 +0900
Message-Id: <DFYCR05BIXCK.24C5YRIM7KK7Y@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
 <DFY76VCL7KO7.29FCRAOOY7FVN@nvidia.com>
In-Reply-To: <DFY76VCL7KO7.29FCRAOOY7FVN@nvidia.com>
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 80396a1b-85b2-4104-45fd-08de5caee56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUNObmE3R2REMWdMOXFhdDhrSnpuZitvYnFWdGswakFra003b0dtL3IzQTNn?=
 =?utf-8?B?dXdYN2x3cmhaZGNObDZlWTFhRXhyMFRUZVZIajFaVHZERS8xMnJwYVFOWU85?=
 =?utf-8?B?NkRLUld2dWMzdm1nSSsrWmRnb3VsVDhncXNUVVd0K2xocHYyZXFDVndwc05N?=
 =?utf-8?B?Sk8vR0h1d1FPV1dhTUlSaXZmWnZEeU0zL1dwZUxudGJvcWQvUzMzMzlsdjQr?=
 =?utf-8?B?TU1jSWlqYk5YdVNySXBybkxkbXBUVkJKcktvUHEyRUtQSTFwM1hCUDRxODlV?=
 =?utf-8?B?QitrZExmYVp6d0VJdkpaa0xCMjZITmlxY0JSY2xRZFBTOWVmYVBmOU05NVVh?=
 =?utf-8?B?d3FzcTM2U091Zk9wUzhlY1NKTUw3YzJBWkFkem5FNGcxYjMxc3c2Uy8yYmdH?=
 =?utf-8?B?ZU5SVm1VOVlqY09mdU94bGpiM0cwemVXVUxBcmhWOFdMZ2pOWlBpVUN1UUIv?=
 =?utf-8?B?YzdzSG51Mk9sU3lnOTJLRGtuZUk4Qk1OUE5XS2QyVlAwenhhczNCNFIyN1lh?=
 =?utf-8?B?UlN4MlJNanRxa0lsTEkxNDU0alRtaEVpb2tKREs5SVlranpHQlM0cE9uTGdh?=
 =?utf-8?B?anBoSzd5YytjNE9Fb2o4Z2hPVkJScXRrdmFJZW56aEhpRmV1Mk9CWXM2YTRQ?=
 =?utf-8?B?NE9kekVPSmRRcnM5cmdsbldNWGE4ckRpTkdFSmhFQWgzM2oxMUVjK1Rqc0Fx?=
 =?utf-8?B?MzZ6N2hsbEFPNmhpdlBXcjBwNnRsN2dkUmZ3ZWZ6M3lrZFVvK3RaR1o4MzNa?=
 =?utf-8?B?V2NmYWtubkM1cEEwMTRYYnpETjFBZGsvM0FIK0hoUnR3ZlphZ1hMaStGTnp3?=
 =?utf-8?B?cHFTTTlHeGJvYUU3Zk9nSU9LTExGaDJBcSs0SmpUMFpobDFSakFiUFNyRi90?=
 =?utf-8?B?L2cvN3FGNUM3ZWhBSlNONFdIeFAyUERVN1E2a3ZMUVpya0ZqNThlTkk5c0Fw?=
 =?utf-8?B?ZVk4OUoxZUVPVnJvNlMyVmVaQSs0bWtRRUVzU1pLOHRNYXB1VjV6bXVUa1JN?=
 =?utf-8?B?cXkxdDIzTWtJeUNNUEVFMHZjSzZjbTlaOE5hVlpjRFBJYzViaVUwMGtxcVF6?=
 =?utf-8?B?d2hpK2xXUFgzbU0vNExMcGJURjNGNVM0a2JGOVQ0OUNGNnBUbUcyRnUyZEdi?=
 =?utf-8?B?RE5lL0FWREhYK3VrRkJLcERybm1vTDl1OWlaRjE1bGJONkl4MjlPajZOSHl0?=
 =?utf-8?B?bXpBek9JUUJKbHJFZzYyd1o4MUxDUlZJdklqK0YvRDhHSUV1WFdidFoveWFj?=
 =?utf-8?B?bWladE90dlpXczdJSmFFUFB4N25sTjd2UVBIZ2FuelRvRXZYZ0o0dUNDTVVQ?=
 =?utf-8?B?ZzhZcGVGS3hmcXlpQzJBRkovQ1NPMGJSM3RhRGl6R3cxNXUrRERERzN1a250?=
 =?utf-8?B?V0dLd0hUN09BUXFhMnc3RldQZFd2R3ViczVFVm16bFgxc3FyNDY3KzdWY0hx?=
 =?utf-8?B?SnowdmcxNXdJeCtYVGNjS2U2aVgwZkdSdVB5TEU3S2ZISnNlRG9zZFFLTFpM?=
 =?utf-8?B?MVRtSzgwczdFaXNqMTlkenZDaWZyMHB3MTRWbjJUOWlPYnBvQnlXcHdmVHNl?=
 =?utf-8?B?VEVXZ0tvMTdpMzAxV3N5SnZTZE52dlRDdVVvUDVYc3ZXVkxYMUQrUVVmWTls?=
 =?utf-8?B?UHFQY3dHblk0NWlPNHRvZUpPZ25qRzgwRGwyOVNTcGtqbVlhenV2Sm5yT1dG?=
 =?utf-8?B?ZHRvazBIVXZYdU12cExiVVpVMTdiNkNLVFRqQ0dGS1hlSGlDOEc4dWVsQVdn?=
 =?utf-8?B?Wmp2TWh0aHY0aDRPQS9TSm03UzdWcVJYcHpkQldiOW5WRm01ZmZWRUdtcy9H?=
 =?utf-8?B?NjFIbVBZT2w4SEdOTkdKSkovZWdDSzIzOFE1aWtjVDZSR05PRTh4NCsxeU9M?=
 =?utf-8?B?aGN6WTlHc3dUaWdMVGE4bjh5eEhLZERHdGRYSDJ2TVF4KzhualFkUGQvUkRE?=
 =?utf-8?B?cHZpS0Rqcy8vMGM5ZTM0TUZ1R2VMeEpIcVRtZ2Jrd0YwTllhT3JlMDRWVmZH?=
 =?utf-8?B?aC92d1VLc1BMOVVaQklNTzhwNUpzMThma2FkYjRmbGZyWGtrUkFSMWpWbEV3?=
 =?utf-8?B?NklneTN0UXl6K0ZqK0hONng3NjhabWxsalpjMUtHVHhicFN3TXBnSG96NVBm?=
 =?utf-8?Q?0U60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGVSaW5ib0RrV2NDZHMvOXBnTFZXR3VUdGdtT0hXUEhVRHMySmk1MUNpKzRC?=
 =?utf-8?B?dE4vRGtkSGZzRmRialNlNHY0dEQxajBoR0w1dzBXVHpRbXpuTHAwS09DNGdV?=
 =?utf-8?B?MGhPclV0US9Gb3JOZEljTHlWSlI1S2l0NWhMdG5TNE9QcHJoQUdYRGltcWYy?=
 =?utf-8?B?Zk9WbGd3REErRkVjcCthemFHS2lqNzcxK1l5TXFCTWdlQVFpYXlYQTh3WlhV?=
 =?utf-8?B?OVFWcFdnWXlnQ2lmOC9ETjZUZWtYaENicmJyN2ZtK2lMUVFNRlMyOHIvT2Qz?=
 =?utf-8?B?Y0JWSWcvTDRpb0k3SmRuSzRLci9rdHBmTGpuMFlnNHBRMHUyanFXK1BOTHBy?=
 =?utf-8?B?eGw0QU84c0J0OWNFbXJ0eFJmTmkyL3hZT2NHV2Q3OU9oZkcwSjMxcGdrT2Za?=
 =?utf-8?B?REsyT1lTZjRiNnlxQ0RmQk43Z1ltcGFHbzJMWFBxRVdwL3dEenA2RTlrVTR5?=
 =?utf-8?B?N09YblFBekdkK1UrTitDSGhNM2o1c1pKNjVreWhsTVU0QUFZRmsweTY0Q2I1?=
 =?utf-8?B?VFhvVnZsamJValkvWUJ0MjkzQmxCYisxY1I5T0w0dTZBOE5kMDh4SmduUVRy?=
 =?utf-8?B?Y2YvWnRXRHBSTEZWU1FSdzZIK0Q2K0tQMkxNT2w3VCtKRWNua1JWa0FHbkRS?=
 =?utf-8?B?aWJsVEJOY3QveG5XRVFiYVl1OWRqM2toNDNqa3BFM2JHZStYU055SHZlQW1z?=
 =?utf-8?B?bHVpSVFIYmpIdys1bFNlSXFCc1ZsOEFXRGFNdG5TdmdSNGhaaDBpMENOR09E?=
 =?utf-8?B?T1FSS0RMeTlEd2t3YWRMcjNhbE03dEJNL3dnTnJ1a2J5Wmk0T2E1MzIxTVBp?=
 =?utf-8?B?QTJqZHlrbUVtbXN3UmZMQjc3d3RaT2xDMFgyb09TR1kvcWMySWNtaFFmUFRt?=
 =?utf-8?B?SEgxNzdLWDFIcklsMGtiYUxSdDF2dHgzM0c3dEhWSnlVdy82clJwZVA1L3Jn?=
 =?utf-8?B?eHpRSVBFRHdkYUdrS3ZtVW1DYzFQekVsRDVXQ0dFbVFIK2pRNGFkQmF3VHNm?=
 =?utf-8?B?NjloUkxYZW9ROC9mRGZMRjNxRDdoSHpQQ1ZOd2NEM1FHNmplRlBCVHQ0Uktk?=
 =?utf-8?B?RXN4MzE1OWFFSWlMaFJqZzNiZWh4UTZENE1VSU1sZVZrL0tZSWNzTDRYS0FJ?=
 =?utf-8?B?MVB3ckVYZExJSHRnTVpRRVc5RzFETGxuQVBXRGFHUlZlQUtydjM5M0taZXFx?=
 =?utf-8?B?SWVJMUQyeW01N0hSREJjM2pYYm91SmNaMnR6Unh1TWtDdDNmZHVlaUphd1JU?=
 =?utf-8?B?OUdZZTJjdm52K3N3U3RWb0tqVGJONVRyVlMyOWFHQlI3STVQWEREdE5pZ2FF?=
 =?utf-8?B?UjhJd2FFTUVTanBteDlPbUFSTjlZVEd3SkMwMk42ZHNOTlA3VG5yYjNsWllz?=
 =?utf-8?B?ajFwQXNaTWc3UWVxdk1MQ1V6OWlNaUhHNjBXUWRhckQzTGMxWTNXQi9iUmlm?=
 =?utf-8?B?a0FyUEFKZm11ektpS0trcTU3d3RzMnNaOTBnd24xM1h5STFkaHRmTnM5KzNr?=
 =?utf-8?B?T3FGN0I0cGxqMWNsZmFFcExxUDErN0g5bWFFaWpiSm93eEZnSzNLYkdyWjIr?=
 =?utf-8?B?bzZDclFOSGRQOE4yZzMzT1FNRytrVGNoN2lUVU1lbDlOMEdJaXdhejhLeEJI?=
 =?utf-8?B?c0x4UGdxL0d6YzNTdEZPWjNjYjdlTFgvRTErUTlobTUwSmF5Wk4yZjR4OUpp?=
 =?utf-8?B?SEU0NkVtV1RVcVAvQ09GckthMHI4TmVaNkgrV2JWeXBzSnFpY1Q2RDF1MjlN?=
 =?utf-8?B?Umx5RGx3WG4xUHpnS3ZtdjJYRzlRR1ZvNmRBWGIvaG45dTlWRkZkbDYydzRy?=
 =?utf-8?B?RkN1bFY4U1plTHZsenFLRnJJZU5MUTVLOXFHNHpPSldNU3Y1eHArdS9BOFZt?=
 =?utf-8?B?MVJObXVCUitlUG9kTE96L1k2VFkxUHJsbjE3QWFVK2REODNuOVpJL05Qang1?=
 =?utf-8?B?MVRHWFJ1bytUK2c4U0h0V1BYQUMxSVVleEpNL0hocWRHT3FyclpnYjNPZHBG?=
 =?utf-8?B?NjNHUjdaSndrb0Z0bE1uNDhHVUVhLzhBTGVFdUVrUmJkOTcvek0rT0tmQkxu?=
 =?utf-8?B?OWtoc3VSZWptaEFNMHNOVlB5Wjk4dWZRMWppV3p6TjZPUzBlNVZob01YRlNs?=
 =?utf-8?B?S24zcVVaeTRmTmdBcXZjUVJSYlBEQkkvZUlEM0tzOGhJRUgvQkhUUFlOVnJO?=
 =?utf-8?B?Q1ZOaUxKNWlpL3lubTNjRzc2ak1RMUNsdEtCTGlCb3JDQm5XTlMzNzUvbVJl?=
 =?utf-8?B?RmJPOWJFb1hYS2RJM1hoL3k0MjhMQ2tna2ZYdUt1Ukw0cU1ua3QveG1nRllP?=
 =?utf-8?B?WEM3UTFEMm02U0RwMUl5elV3cWxWU2duZGFOVnRkRkxlSXgvelg5dnhtUjJq?=
 =?utf-8?Q?Ul1it26zS04HRPgKW2bFZuzdjN5UcnNWICzNBQLH9pGcl?=
X-MS-Exchange-AntiSpam-MessageData-1: zGO9TBsEa0c2Fw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80396a1b-85b2-4104-45fd-08de5caee56a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 07:45:37.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2zYPuqhWgTOzq9LIbhn7aBcNHtjCsfUvpQycB1gOABcmKLSnMoeti83N/FOTOi5wwD/AEExZDdUaOPiakpl/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

On Mon Jan 26, 2026 at 12:24 PM JST, Alexandre Courbot wrote:
> On Wed Jan 21, 2026 at 11:50 PM JST, Gary Guo wrote:
>> On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
>>> Add a macro for defining hardware register types with I/O accessors.
>>>
>>> Each register field is represented as a `Bounded` of the appropriate bi=
t
>>> width, ensuring field values are never silently truncated.
>>>
>>> Fields can optionally be converted to/from custom types, either fallibl=
y
>>> or infallibly.
>>>
>>> The address of registers can be direct, relative, or indexed, supportin=
g
>>> most of the patterns in which registers are arranged.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/io.rs          |    1 +
>>>  rust/kernel/io/register.rs | 1198 ++++++++++++++++++++++++++++++++++++=
++++++++
>>>  2 files changed, 1199 insertions(+)
>>>
>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>> index a97eb44a9a87..eccaa176b6b9 100644
>>> --- a/rust/kernel/io.rs
>>> +++ b/rust/kernel/io.rs
>>> @@ -11,6 +11,7 @@
>>> =20
>>>  pub mod mem;
>>>  pub mod poll;
>>> +pub mod register;
>>>  pub mod resource;
>>> =20
>>>  pub use resource::Resource;
>>> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
>>> new file mode 100644
>>> index 000000000000..e414aebe4c86
>>> --- /dev/null
>>> +++ b/rust/kernel/io/register.rs
>>> @@ -0,0 +1,1198 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +/// Defines a dedicated type for a register with an absolute offset, i=
ncluding getter and setter
>>> +/// methods for its fields and methods to read and write it from an `I=
o` region.
>>> +///
>>> +/// A register is essentially a [`bitfield!`] with I/O capabilities. T=
he syntax of the `register!`
>>> +/// macro reflects that fact, being essentially identical to that of [=
`bitfield!`] with the
>>> +/// addition of addressing information after the `@` token.
>>> +///
>>> +/// Example:
>>> +///
>>> +/// ```
>>> +/// use kernel::register;
>>> +///
>>> +/// register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision informatio=
n about the chip" {
>>> +///     7:4 major_revision, "Major revision of the chip";
>>> +///     3:0 minor_revision, "Minor revision of the chip";
>>> +/// });
>>
>> The comment is inserted as doc comment, but it uses the string syntax.
>>
>> I guess the idea is that you want write everything in a single line so y=
ou can
>> visually align the fields? I think it
>> looks fine on the fields, but the same-line documentation of the type it=
self
>> looks a bit off.
>>
>> Something like this will definitely feel much more Rusty:
>>
>> register!(
>>     /// Basic revision information about the chip.
>>     pub struct BOOT_0(u32) @ 0x00000100 {
>>         /// Major revision of the chip.
>>         major_version: [7:4],
>>         /// Minor revision of the chip.
>>         ///
>>         /// This would also allow you easily expand the documentation in=
to
>>         /// multiple lines!
>>         ///
>>         /// Perhaps useful to document some quirks about the register!
>>         /// I know currently registers and their fields are very underdo=
cumented
>>         /// and they probably don't need multiple lines, but I hope that=
'll not
>>         /// true in the future and we would have detailed docs in the dr=
iver --
>>         /// in which case visually aligning becomes impossible anyway.
>>         minor_version: [3:0],
>>         //           ^~ closer to the variable syntax in Rust
>>         //             ^~ I keep the hi:lo syntax which I suppose is to =
reflect Verilog.
>>     }
>> )
>
> That would definitely be better, unfortunately since this is a
> declarative macro it cannot match against comments, hence the current
> syntax.

Looks like I might be wrong here as well. Doccomments can apparently be
matched as meta items, which would allow them to be re-emitted inside
the rule. If that works (LSP unfortunately doesn't let me check that at
the moment), then we should be able to do as you suggested, which would
be great.

I also only noticed now the proposed reordering:

    minor_version: [3:0],

I don't have a strong opinion on that, but fwiw SystemRDL seems to do
something like

    field minor_version[3:0];

If we agree to align on it the latter might be preferable?
