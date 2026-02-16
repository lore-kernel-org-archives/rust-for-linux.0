Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1731326B742;
	Mon, 16 Feb 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229114; cv=fail; b=Ne8A+m9sZW3qfjRAqRWm2ZYOd9dd1UyHjRnjNHjfumHgsJzGdBduIrfy8CNopEOEdXb62W17cOEXojMbQzMw+NCWe9yNAswYtxqYC3pO/gaMkWxlsIepQcSigUscQHv1X6upc1hYq4xFdRtfC7/S41IKFmWEV2NFiKCi+vfVyG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229114; c=relaxed/simple;
	bh=0G9epAGMgS0XIIvJ/XhhVMQaBAXYX3OZQdsNJ5AwDwc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KVkD4cq8kqCwUx8OU4FQALbmfEeP8CqE0EEVAm3EwPUWfufaW63KtjQ0ti+U7AQl0k3wa1A5Y0fYD0RjqIofe1GRyqIWUz//aoADNJO1riFdHWaBjIdAXYhFjg78z93O/Q5WasKgLGNzAAPqHglDQKudXyr/+7bYKEPIPz1KffI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BdFETPXI; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BdFETPXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttjragETdUEzIaNkkGeg5BHgEJVGRS/tjBMJmce56Lbjj3luKo8aRE9HVyUo+q06nLQ9KFfhZe7MQao+Sv2R1ejXoL1exylIKr8WhkYzz14JuB8yR/8fvoZi1ecjqyK9liQrPM5ST34Wk3kwKH6jjv9oti7dK+BzwvbWNVRC2KNEkTAsMOoBWvt6toepBxLTg+R0etLpOar6SaSit5BC0S2jexThzYG0OwvYjGIgkEbQZ04eETdeUcsZUqm4bFQfqTrVs59bKcA3qNvxCVFw8LBgT3bHvabFzYNDAW5eZgaG9dzJbw9OT7oidWi1lgD7gcnD/67dLSoxhxEuNaYFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1ivDmD7zUj9PMjh9evmyEI8fc3p53Vj9/2oh2pjc1M=;
 b=xGVwI3OFNCuWDafQOiNZVyJqFcpzhIqIXJuYSehR5H2/1n47sInolU29+UIKVZD188llfsSzFCUOer5U94RRXtpDUdt8wRuqP6ruHWvdIT4h5Aj+R6OZbtsJ0mzYvJ5XDHW/O4VLxRr/JKsgxSflCTtneCFwb94HFEST7VnRNnAUeZ7ZPnXNeyuOQJwEFYMDM9DVFQ9RgMhhKlnW8LCDZyyMhphNTeVawhL3ELu8if7fSsEAV8nO1OOf3YRnmL8BBa0BnYg39ZmY3Iex0Hkt4W/brj1GtDkzYC8wJnXtDdrkwZWJ8YleNMFBegLEEC1asaB8/eBx7nrGV/HKoEhBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1ivDmD7zUj9PMjh9evmyEI8fc3p53Vj9/2oh2pjc1M=;
 b=BdFETPXIs/zj6bfI5QjnU7i/tfUdzxocSEA+oKk1WzB8sbJKwZ1tsjVw71YAkOEHp18R2BAU+tCOpvWM4XhxNceBcZ6ZJy5p2cnAZvpVhZbX+2Wqd1UV2meS0dkugP9MOSLZ42zdy+mVS/zgfT813S/9rf6GAtt61NAkQSCQboiLEKHV+KHRFqq5uRxuJoaOsZ0u3FzOv8RL0uw0jopo5waeLUEe7sO9BtTaMCPtsY7mmwadiGD+9Dn93U651Fl4CoVMbrMFQAEBqkFhas9oaE9lM3BbbP9trLMH9ReuGtMHZuZCnPTDhecrJcECFIaWwWalxtusxcpWR4kbpvLg6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v6 0/9] rust: add `register!` macro
Date: Mon, 16 Feb 2026 17:04:36 +0900
Message-Id: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMTWrDMBCG4asErauimdGP1VXuEbqQpUmiRe0iB
 5ESfPfKoVAFL79hnvchFi6ZF/FxeIjCNS95ntqwbwcRr2G6sMypbYEKrQJwsvAlLzcuMsYwBkg
 IDki09+/C53x/pk6fbV/b21x+nuUK2/Uvguo/UkEq6ZACOE2jMe441ZxyeI/zl9gqFXsJncRN+
 uTHIRkmG3aSemk7SU0i4RCMT44Ad1L3cuikbjIwUyBK3mq/k6aXvpOmyajN4KJXaEC/yHVdfwG
 1fQfciQEAAA==
X-Change-ID: 20260117-register-ccaba1d21713
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 754e89ca-a9ef-49df-1ef8-08de6d321985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L056QjMwM3g1L2I3SmZvTHd0VVZRTFRYNjEwTkpqdWhqQmJjLzFjM3hOSUlT?=
 =?utf-8?B?d09VTUNYU2RKbjZ0R0Z4K0dwaVVoaE55enhpK0ludTkrUzgrMlNrZzhJQndW?=
 =?utf-8?B?MFNxOXJ4ZWRZMEV6eENzZ3N3cU1yRDNBVDYrOUR0dmJsT3BPeVZ4U2VsMU5Q?=
 =?utf-8?B?UnZZazVIN1lMNjFwR1lxQTVCZnl6ZG9yNnc2Y1ZETEVFL0pqcGxCNlRMdGw1?=
 =?utf-8?B?SG9MajBIYnJxL2ZTT2l3MXdxd04zVWxYOVZHaElhdmZkVm55Q2N5SW1OZHJl?=
 =?utf-8?B?VXkrT1ZTT28wZlFoS2Z2TG05WUM3R1JLWkVQcXZPSXZ5a1QwVGROUjNQa1lC?=
 =?utf-8?B?YkVZRFA4L0ZRMXloM01hbUtyS3FQd241eGNMTkd4WjlQS2UwWG9QeHdxVk1j?=
 =?utf-8?B?bTY2SmllYjlFcWg2WWY0K1QvUHdDREQ1NUw1RU02MkZ1ZW5GN3c1V2tOTVhi?=
 =?utf-8?B?eE84b3dhTEpQWmtWZ0tmSytzd2QrallQTmduMlZGNVFMQ0dQbitNMGo5YVE3?=
 =?utf-8?B?SVBDZEZ3TE44RU10S1dkMnErNHVHMURQTm1oMFBhaFR4RGRCYUdPMlMrRytY?=
 =?utf-8?B?YUF5dEhIbWRLQmhIQ3U5TXNCZ2VZVWxWdlNNcHBBN2FHWGdKN3Zadm5PNFhH?=
 =?utf-8?B?Qkw4dSs3blBqYlpkYzBDWnhxQXF4a296UEVvMFVtdVdzbU5jS2RiTS9rYVVX?=
 =?utf-8?B?NFlsdkJJbHQzQm1NOEZpZkxaZzRvcVJQVjBkdWlyN0R3R0wwSDFnRVBtSlpR?=
 =?utf-8?B?WnhHZExJbmxid21VbWY1cER2Rk5XMVI3OURKbng5bUcxUXRBSGt5bmFISXVi?=
 =?utf-8?B?Rzl3RzlBRXFhVEFLUFk3WlNPeTVoNHNZUGtxMFUrL2M4OHAxbnpMaFUySHdW?=
 =?utf-8?B?akJhTW9aOWhDbndJVnh3Yjd3R1A4ZVBOY212TlpkNXJWcnRlem1vYS90d3Vv?=
 =?utf-8?B?VXRaTVhQclp3d21WNWIzUHBpSU1YeXp2REJPVEdhZC9iQm5PbkRGV084RmVF?=
 =?utf-8?B?aWc0OWIvZjNCQ3VIZXQvMkk0Nm45UmlGeTIyVlMvMnVwV1N6bmdzRFUxMldp?=
 =?utf-8?B?NXl1b1dZUmE3SlozeXB2Ulhpb1NUYk1Ka3RwQllzTnMzbGlrcVhkTTYwcXhZ?=
 =?utf-8?B?K0VjN3dKeXhQY2hlZDNpRDBnZHV5YzZTTnhpeFdrRUpFb1dYNE16R3JUS01z?=
 =?utf-8?B?VTk0K0o3bWtkZkNhTjBuRW1hdVBqQ1RyRklSeVJFVGFnZlJWODIrYTBLWHI4?=
 =?utf-8?B?cWZoWFNFWTAyZ2l4UVp6WEFrSWVna1F3Yi9TYkZzR2RWa29PZWdCd3NpMHlF?=
 =?utf-8?B?Q0ptS0hUV1pXR0FjTWJDUFQrN0ZSVDZLN0Y5ZEFKWDMvVkU4ZnZCT1NrK2Qx?=
 =?utf-8?B?Mm1NNE1zaGdNOEJrM1pQWEtPWlJsbm96OVYrNU8vRW53engyaTJLN1I2aVpX?=
 =?utf-8?B?QmNSbEZLbFpZNVA5MFB6cHBtRWRDY1FkUUpBdEJmZyt2aHBIbytlWFJ1MklM?=
 =?utf-8?B?Z3Bya203VEMxREZxQm9sQVFWRlJFV3BQZGpWdjV4cDZvTDNZWnJLUzVNd3BY?=
 =?utf-8?B?c0JVZGdlSnBhQXFzMjVud3Z2SHg1S2xaaDE2MW5NOUhrY29xd1ZJeElvU2VR?=
 =?utf-8?B?Yi9vOHJCSjFPTlhYbGhoc3hnTUdmQ0NObklCQVNvdEtiT0VOQVd3V3VpZERS?=
 =?utf-8?B?RlBtYnBxRnNCZ2RzcTBhRkNveEI2TDRBUWp5ZDhUMXE2TXMveU80RFZvSnd1?=
 =?utf-8?B?T3o0eFpTa1pmRDdVVjcycmRjbHhvU1VXUVNJTEtneXoveldXa05xck1sVkNz?=
 =?utf-8?B?V2s4d1J0VDdIOFVkMjVlTlpmZnY1ZGR2Z3JybnpZLzlITGRhOG55WkVXYXhl?=
 =?utf-8?B?NVhsY0ZpbUtWbExMaGJoV1B4WlpYMlk5UHZYcms5a1RWZFMwVlVET0N4NjVr?=
 =?utf-8?B?V3UxbHJ2Q2t1Uk1USXIyUldRcVpXK0dDajFIUlJVSXFDQWFCVjA5eitNaEVC?=
 =?utf-8?B?bGFaQkphZnIxL0tnaFh0KzlCWnBkZ3VOYW95bnVsVHJmN0JZdTlKMk8rb3Nw?=
 =?utf-8?B?b0N0OUtqYjNxVm9yMWFzb0pTdUJlUXVjSXRkYzBJYytwSXZGTzRRL21NWVJI?=
 =?utf-8?B?enRZcnJScWMvQzkzZ3FJbjB4VFg4QTl1M003R3RzUDdGV2NwYTBUeFZaNTFk?=
 =?utf-8?Q?zy/FYUyVMFjUN6Ahj44jACc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlRHVElIb1NCbDBmOTNJdG5wdW1FbGt6UzJxdFA4WmsySmpZVlF5cUZ3Yk1G?=
 =?utf-8?B?WkZudFRtVlVTZE1oVjNXMnhjRktldDFOVzJGV0FhVVAwZ0pqK1d5Y1Z4bjBj?=
 =?utf-8?B?bSs4dDZnNFhRWFNOMk9vOUllMDY3RlNWbTFDVWV5Q0NQakFQNWtCbmFGbXZ3?=
 =?utf-8?B?dVZPR3RTTG9SRzBNRnZaTU1NNk1tbGdBT0doK0NkcTBpOFllTnFFK3RUZ0Nw?=
 =?utf-8?B?bERYcnJaUzFHUFd2cTFpUWwzY0RLa3VUN1p0Sm5iQVg4WnF5SzJLQ0hYdVdV?=
 =?utf-8?B?VlpKZmo2b2c4eFZOdzB1dlZDMmNiYkE2WkcyMzIyTFhPbHYvSnBCV0VidTFM?=
 =?utf-8?B?aU9GV2JxRU8xNDkrdjBXZE1TdWpUeldMRGZxWlJ5eXA1U2JFLzFGSjAzVmVs?=
 =?utf-8?B?cWhtZlE0eUtleGJrcWttQ09ONEZoRDBmc2NTa0xwS04rakdCa3RYZmNqeDdl?=
 =?utf-8?B?bDliU0lUeHZrd2RiYVVGUjlTemJYcERaZm5wNWxrZ1hVdG0reDJnZXR4dk55?=
 =?utf-8?B?VlVoTVF3SGV4TE80MWVCb1VxVnVLUnBnSU1CRE5CR1ZZMER2RGVheTdreTVR?=
 =?utf-8?B?K1NGQjVXRFhyOW8vZUJVd0VsSGNYbEE1RjBpSjg4c1JtZ0lWcXFDWFgvUXBk?=
 =?utf-8?B?ZXRWa21uNHViYVZpdzlnQ1JDWG15Y0pEY3dnNktGQXRjVnRmbVF1akI2Vm1Y?=
 =?utf-8?B?MW44K3BUd2RKcXFERGJxeWFSdTZsQ1FycEM3SjUwNnNKMEd0MUhvaUF3WW9U?=
 =?utf-8?B?NkJjZTVzL2VpUXd1UVRUYmJ4TUhHejlmV09pek10NXZwdDJEN1JVMUxhM0Mw?=
 =?utf-8?B?MG5lbzZkYm9ZN2JtVlp3STBTaDBOOXlieWZpbnM4WDBzNlE5bnpKdGFuYWE2?=
 =?utf-8?B?QXVtdXVaYlM2ZXZaM0FWMC9NdUhUeXlueHpNL1FGYTlXbzNMSUR0UDNYa3Q5?=
 =?utf-8?B?UTFhaWY5dUtIS2dnclpIWHEwK2VLbmlEdzliUzNpazBXK1FmQ1B3WkJKT2Vm?=
 =?utf-8?B?aDJOemM5eTJaZXREVHM5alJEVUdWZnYrandzUlBTYjZKL3lHbWtmNzBnZi9D?=
 =?utf-8?B?TlRhaXY2S1hyN3Y4L3BaK0hlVHRIUzV4bmhWOGxtcHVROHdjbnlZMEV3bXVs?=
 =?utf-8?B?WXBZUzFSNDBUNStqRmRERGZERlpKd2FSMCs2NTN4aU9lazRkZ2ZXdS95ZXhW?=
 =?utf-8?B?K0NXTVVreTlwbkRSc1laY25DbE9QaU13NytGSTZ3elR3ZThiM0w3SlpmR0tJ?=
 =?utf-8?B?VVJaSzl4cGJIRmlxVDlRUEx0UjVzNmJ1aGtDak1uNCtMNCt0bWtEOEdzUTJH?=
 =?utf-8?B?THByNFNwdzVSMG93RWlGc0luZDI0ZGkzZDhjZWVGbkY4R3lVU0JrN3NiN2k5?=
 =?utf-8?B?SE51SVJJU3QrdlN2d0s0ZGRycmFlWmJBL2VwNEFaWWtkeFFma0V2U05pWHR3?=
 =?utf-8?B?RWNxVzhreDlLSnhKNWt2ZzBydmJqdm9acnZFbGs3Tk1COURZeVhGRWlGU0wx?=
 =?utf-8?B?ZU1xRHVpRm9lK2J2K0VTbldrYlFUSTRYR1QzQW5WVDAxRW44TlNTclpHMThI?=
 =?utf-8?B?Y1krdlh0YklFRGRLM1JyWGh0aDNiQk1abEhEa2dKN1BvVC9wUFdBSmNhMnVv?=
 =?utf-8?B?ZVRxNWk5L25qbGJ2YnFUKzJnb0h4SUoyZTNWdU5SZkJ4RU5welRJaC9MRkxY?=
 =?utf-8?B?NngxTkFlaWNnVFkzRzU2cXhWRGtKTGMrSG04ZUN3R2hOdm0va1VRTmFLZlFu?=
 =?utf-8?B?cmF4cjBISFl4YkxtN0tSQlVMbXFFem5DOGczdE0zYkRnZC9DdVlkRlc1dTVu?=
 =?utf-8?B?UDdRaktyK1kvRVJxaHpnYklSQWh3R0VPQjRWRHhEQWI0MTE4Wit6UGU2TUVm?=
 =?utf-8?B?Z1FzMU4rY1BXZG01bDluS0RPWXF6NXFMZlgyQnR0Q1dKOVorUWpTMXN2bE9k?=
 =?utf-8?B?dEZ1akovKyt4WkxiQkhTb0JuNDJnOGRGNllqMTE3TjdsYVhkMzNCWnFwNUpM?=
 =?utf-8?B?cHE3YWVreXRDS21Ic2lHdEhRbkpEdlpSc1ArdytUd1pHQUhMbFhjS1BqcU5P?=
 =?utf-8?B?VGNWeVlHMTdiRE91a0I5amZIdDBPWkFLMjZvTEdhdnBKZUJQUEthREVjVXlI?=
 =?utf-8?B?OGRCSlBwd2l5c1RuRStyZ1lrYityQzRVU0dUL2d3VGg4TTlZdGhFMFlXZi82?=
 =?utf-8?B?ajJ4Z2F2d2w4VVEzSVlKang3ZnU5STc3bnM2TW83dTl0L1RxTXp5RmVIY01m?=
 =?utf-8?B?RzdyVktaQWNMWmY4WFB1NEFlemV6Y255VHMvSlQ5eFJJWkxGTmNySG56VFJ4?=
 =?utf-8?B?MDlWSWt0c010S25CSVlPeEs5RE9VOTdPbVZWdXhtdDBBNW5mZDVKMjBBblNy?=
 =?utf-8?Q?Nb7AhTQ6pcEMJf0KIRrqAC8O2XxTTGsDSiPNAL7xWPCH5?=
X-MS-Exchange-AntiSpam-MessageData-1: 2wulyYKP191ysA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754e89ca-a9ef-49df-1ef8-08de6d321985
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:08.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HJaXcjrWke8RyrgBbJYF7M7XHHja504n8+Xr3BhNvCAZpANJQ+fDS3ERrKAxmZOll0Qxikui3zQSaGJOlyYXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

This new revision took some time because it is (yet another) overhaul.
^_^;

Thanks to a breakthrough by Gary, we found a way to have the I/O type
perform the actual I/O instead of the register type, which moves us from
this access pattern:

    let boot0 = regs::NV_PMC_BOOT_0::read(bar);

to this arguably more natural one:

    let boot0 = bar.read(regs::NV_PMC_BOOT_0);

It also has the benefit of taking advantage of deref coercion for types
that wrap an `Io`, something the register-based methods couldn't do and
which would have required extra `AsRef` implementations just for this
purpose.

Furthermore, this resolves the inconsistency of the former register API
that couldn't use the `try_` I/O accessors (and even had methods whose
names clashed with them). Now if `Io` supports it, it can be done on a
register.

Another benefit is that there is less work done within macros, and more
in generic code, which is (generally) a win for readability. The
`register!` macro is considerably smaller and easier to work on, and now
mostly made up of the bitfield accessors that will eventually be moved
into another macro.

I decided to remove a couple of tags because the code has changed quite
a bit since they were obtained.

Gary is listed as co-developer on two patches that bring his idea to
life; I took the freedom to add his signoff for convenience, but would
be more comfortable to get an explicit ack after he sees the code. :)

This revision is based on `driver-core-testing` as of 2026-01-16 with
[1] applied. A tree with this series and its dependencies is available
at [2].

[1] https://lore.kernel.org/all/20260206-io-v2-0-71dea20a06e6@nvidia.com/
[2] https://github.com/Gnurou/linux/tree/b4/register

Initial cover letter follows:

Add an improved version of nova-core's `register!` macro to the `kernel`
crate for all drivers to use.

This is not a direct move from `nova-core`, but rather a new
introduction to facilitate code review and introduce features that are
missing in the nova-core versions. Differences notably include:

- Use of `Bounded` to prevent any data truncation when manipulating
  bitfields,
- Much better syntax (thanks to Gary for all the suggestions!),
- Extended documentation,
- Doccomments now build and run,
- Supports visibility and different storage sizes,
- I/O accesses are performed by `Io` instead of the register type.

The `bitfield!` macro of nova-core has for the moment been wrapped into
`register!`, as a set of private rules, to allow `register!` to be
merged first while `bitfield!` undergoes review during the next cycle.
Thus, some of the code from v1 (including `bitfield!`'s doccomments and
Kunit tests) are kept for later.

The first patch enables the `generic_arg_infer` feature, which is
required for generic type inference and used in subsequent patches. This
feature is stable since rustc 1.89.

The second patch adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. The third patch adds another convenience method to obtain a
`bool` from single-bit `Bounded`s, while the fourth patch turns
`Bounded::get` into a const method in order to make register setter
methods const.

Patches 5 and 6 introduce the `IoRef` and `IoWrite` types around which
I/O accesses are centered. This allows registers to be accessed using
the same `read` and `write` methods as primitive types.

Patch 7 adds the `register!` macro and the types it requires.

Patch 8 updates the Rust PCI sample driver to use `register!`, as per
its TODO item.

The last patch illustrates more extensively how this macro is used by
converting nova-core to use it, and removing the local implementation.
This patch is to be merged one cycle after the other patches.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Changes in v6:
- Remove Tested-by tags as the code has considerably changed.
- Make `Bounded::get` const so it can be used with registers.
- Use the `pin_init::zeroed()` const function instead of defining our
  own method.
- Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
  make registers use these as well.
- Use the more natural pattern of having the `Io` type perform the I/O
  access instead of the register type.
- Convert the whole PCI driver example, and not only the PCI
  configuration space.
- Rename `Bounded::as_bool` to `Bounded::into_bool`.
- Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
- Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c902514@nvidia.com

Changes in v5:
- Rename all setters to `with_*` and `with_const_*`.
- Use `, stride = ` to specify the stride of register arrays.
- Remove `Deref` requirement on the `RegisterIo` trait and make it
  `#[doc(hidden)`.
- Simplify the top dispatch rule a bit.
- Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com

Changes in v4:
- Add `with_` const field setter methods (removing the need to call
  `Bounded::new` for constant field values).
- Add `into_inner` const method for `Bounded`.
- Add `from_raw` and const `zeroed` method to create initial register
  values.
- More documentation improvements.
- Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com

Changes in v3:
- Sort the Rust features list alphabetically.
- Rebase on top of latest `driver-core-next` including the new Io trait.
- Allow several registers to be defined from the same macro invocation.
- Remove references to `bitfield!` macro.
- Fix doccomment of `shr` and `shl`.
- Use `+` syntax for relative register offsets.
- Move register arrays size and stride to after the backing type declaration.
- Use regular doccomments to document registers and fields (thanks Gary!).
- Remove `Default` implementation and implement the more predictable
  `Zeroable` instead.
- Improve doccomments a bit.
- Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com

Changes in v2:
- Remove `bitfield!` and put its rules into `register!` to give it more
  time to get reviewed.
- Allow output type larger than strictly required for `shr` and `shl` on
  `Bounded`.
- Enable the `generic_arg_infer` feature, required for rustc < 1.89.
- Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com

---
Alexandre Courbot (9):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `into_bool` method to `Bounded`
      rust: num: make Bounded::get const
      rust: io: add IoRef and IoWrite types
      rust: io: use generic read/write accessors for primitive accesses
      rust: io: add `register!` macro
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs           |  249 +++----
 drivers/gpu/nova-core/falcon/gsp.rs       |   23 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   65 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs |   11 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |   17 +-
 drivers/gpu/nova-core/fb.rs               |    6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   40 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs     |    7 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |   22 +-
 drivers/gpu/nova-core/gfw.rs              |   11 +-
 drivers/gpu/nova-core/gpu.rs              |   36 +-
 drivers/gpu/nova-core/gsp/boot.rs         |   11 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |   10 +-
 drivers/gpu/nova-core/regs.rs             |  544 ++++++++------
 drivers/gpu/nova-core/regs/macros.rs      |  739 -------------------
 rust/kernel/io.rs                         |  345 +++++++--
 rust/kernel/io/register.rs                | 1125 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                        |    3 +
 rust/kernel/num/bounded.rs                |   70 +-
 samples/rust/rust_driver_pci.rs           |   84 ++-
 scripts/Makefile.build                    |    3 +-
 21 files changed, 2106 insertions(+), 1315 deletions(-)
---
base-commit: 916328497055bdfc1d633f04a33ab7d4dc91f45f
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

