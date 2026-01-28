Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6631286D72;
	Wed, 28 Jan 2026 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567861; cv=fail; b=hP6RGSnxPjL/GCKi2KP8gih+KE+P8F6os/LMQO6sNNNj49UtjRO05slUATRaojScmbxhOgwURtQwx8v9UZzlZ8NM9RdwralYDOGPRwJX6MVE3R9fsorsWlSHIL1bDfR4qh3M9quEhZvcXoL8xyQL8lPbVP2gBEknozLeTaaRLCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567861; c=relaxed/simple;
	bh=j3KQqq15pNhbCjxoNfzBHLw/lmMMbFPhDeeDvluwHr4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=uDjPyof9z/0wLfaise9fRoCU8BqQ/eTFEeZJ+iUWBMxh/V9xZzb32bxRAeZ6B1xx+PiuNsGBCw8Q+0yFKpX8ODX7OpYPCVSY9cwGCYGqkpLL6dPito2L7nsl5VAwI7uCdnFyQX1ZyVBgoc5kvEKq//B0qUQ5OgDhJdh7vAA+DVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZToPUstP; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZToPUstP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sy6pozxmsuAPa7ExQtkd9PtQrdqz7yjhSVDBM/pRDg11sMkZtY/06Y+aLK6gpkw/n9Q3W+AV9ZvDYczoIFa53KeX6MfxEBT1J/dSP2Bt3e9Yzukn1bD9O/TxVmtX0yp+Krs296GSGbcIOiC90YQjsDFrX5gkRfZrGs7XH9uI/TgRi3EVeBsLt+Xme4nCsBxQwezYTSJ9cQqtWH//OlOmNHt6qBE9ausM5UKsp8NxiQjm6w2qq5JpiZhRs0GxS8fX9VSu8HWrNmySjigPWE6u8nmSYlZnvZ+MXdPfSfar1ux/6gQu2P/1VjiLdUVFxq9u8v22578o3UPcMnlnqT12dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+TPXnSLdB87Cce2PZOLkIOl50e9/RUkL93gCUnFX+I=;
 b=wRPsWi1kNOCu6k/0MW+XrcmSbF6EU/7ZpyiWiG4zWGq3/vIcTdvM2Uh8URzyOGbPBL5Oe+r3I9rGrXpK8m/q/6p8C4zUBUYdwXCzj3YJoFRMyIsO4DT3uQtGAcWkoHnBKR609+8zmEsNAjP/Yu5Pppxcf87KdFvqJWmQ8n2q7WI+9swqbPCPAmhvxY2Zz/cIKZCdhfFvLlB/eJZ+FM+EqgqQpIQLwwmUapmp/8ZA0sfpJEmXYuZ5gFzxD2WdqDb/PfF6uBLSEnibVVSTDPdR4Iv3vodnnyz5VQ2FKbWfamA935pTDqtpbDPXTadaER0KawjYnCoIjE/fsl4Xl6rcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+TPXnSLdB87Cce2PZOLkIOl50e9/RUkL93gCUnFX+I=;
 b=ZToPUstPDDPQY4zN8+zOOPUF1OQVuA2Iq1Dxtw+A/YuZQh/pAXcn69AZd6l2Qraxqnml/oQCa2gmcyna4AMut/6avL+ZYZUpLmlJMkq2PyLuhSHZC0C3zS7yl0Cvonl+bf4Ka5nYUINqlkfAmWqclsxHMFdgFQB+wDtwfVoOLl1wNDR5QUJTy29Wwr+eyWXlzymA2v29bxxRfFlpHogBHJ2iL81xzVjf4RVTFB0E6/lHjLgryVsJmk+gG3bbXEHQAwO9MAc2EKQ9nz1kdqhCm7zIS28GpkxKz35rTcS/6JTN91AwiMNLOhw76KCJ/n4SERixObahkBhBMj3+Ffnqhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 0/7] rust: add `register!` macro
Date: Wed, 28 Jan 2026 11:37:26 +0900
Message-Id: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQ7CIBCF4asY1mKYoZTWlfcwLihgOwtbA4Zom
 t5d2piIcfkm8/0ziz6Qj+y4m1nwiSJNYx7VfsfsYMbec3J5MxRYCwDNg+8pPnzg1prOgEPQIFl
 +vwd/peeWOl/yHvLbFF5bOcF6/URQfCMJuOAapQFdyU4pfRoTOTIHO93YWklYSigkrrJ1bdc45
 WVt/qQsZV1ImSVKbIxqnZaAP3JZljf9igYLFQEAAA==
X-Change-ID: 20260117-register-ccaba1d21713
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e05c78d-dbc1-4fb0-4160-08de5e1631e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ty9kTUNYUnZtTmpiaFBVaGJ1K3VjYkd1UzdpQzkwU1lnT0VjRlJGNWZKRXE5?=
 =?utf-8?B?a1ExVkZtV0lVVk9VNzZiUlUzUU9VbW9xenI1UEtUc0ZyNkpveGE1SGh6QUhY?=
 =?utf-8?B?V0c0elBhbUxoUVFxanhOT01Nb2RoQzRWbXlSclBuREk5amxLOSsyNTg4eHNr?=
 =?utf-8?B?N0ZFTDZTVWFmc1N0WnpTTVFobUNJNkVPOFZjemJnT3I1a1ovTyt5MG0vVGg5?=
 =?utf-8?B?TGtMZTNmMDFzQUFxbHI2MVVGSDNWbXBNMHZTYWVnY3A4cnBMdE1WQlY1YVRF?=
 =?utf-8?B?SzB1bFZKVVNEYlJtUGNhU3RrTUx6K0NBb0k5UStnSk9VekY2ck90NS9xaHh1?=
 =?utf-8?B?VlF5eEpvNXRlT2N0Si80bSt6K01tZzJDR0ZPTURyZTU4a2FFc3FnZm5GdVp0?=
 =?utf-8?B?WUxxeG1uUUk0emM4TU9nTXhkb3ZEd3p3bk9WdlpOOUZLTWFlZlFBT29BcWM2?=
 =?utf-8?B?K1grU25kL3VnWDVHZUxab3ZMeUV6RVZtYkVTcTY4Qk41dHY3SzJJVjgwaE5C?=
 =?utf-8?B?TlZFUTMzNUwyWHBpQ3VCR3ErQnZVT1RHUDRCNjI2ajgwQnFQSHJOeEtkdjBo?=
 =?utf-8?B?aDhSTGhTQWtpbEdYZ1pBS0FzWkczQzBlNG1pT1lCRFhsWUxMamhDNHdCUGgv?=
 =?utf-8?B?bVhibm8xZFdSKzdSeklYMEkzWHY3MGZnQUpUaHRwaEtJVkNydG9rQy9PeHBy?=
 =?utf-8?B?bXU1MWNOOXpKTk91MDVuTzQzYUJJaDdJSjZwK3VQaUxUS25seGZIbWttZVYx?=
 =?utf-8?B?VFI3bXNoOCtVR1JRN0RSclJiK010czNoVmw3U0dyczY2dzNCVmRYNkZOYXda?=
 =?utf-8?B?cHAzckRrTHo5SmRFSHAzektzU1Q3di9rVTdLMVJ3eVluTkkxNkRqMEhveEkr?=
 =?utf-8?B?ZVB5S3VMc3VBaDFhSjRhbTVaZUhMbnliU0RXV1o0UU1NQlR2dDZUU3EvTndK?=
 =?utf-8?B?RXYxN2RaMVpEZUF3U2t1TGMwZzFyOFdENk10NGU2cU5RS0FMTjE2UE9VeVRS?=
 =?utf-8?B?TXhWaGhLalNNYWRjc2lBUXJCMFF2RmFsdUt5dzE3bWlmbmpEKzgxWlZxbzQ1?=
 =?utf-8?B?L2N1a0h2dXM3aVNOOXYra1NoVEkvcFh6QmhoM0V5Q3ZISU5uRGE0QlJudFBv?=
 =?utf-8?B?aUV6SHI0dUpnVDlURzR5L2x2dkkzRXNpR1ZzU092VlRmNUNHdExOVGMxUFp0?=
 =?utf-8?B?OE5Fc3NNM3Qrc2tyU0psU2VDWUpDZEJ5WGNoSFF3RjFYTHAxNmZBaDIrSE5r?=
 =?utf-8?B?NGV4YlJBMm1MZGY2a01vVkJVN0xFcmhBLzg1NzFZbkEwRU9wZlhZUFFCb2Jr?=
 =?utf-8?B?V2htTFhUQ0IwUTBMVDBxbUlGOEpVeUp6RHFsNTFvTi9sSGVCQmJQUzY2Nnpw?=
 =?utf-8?B?VkpHUWtsc0xKdllxQmtEVlBNZEtOdlFBZDBsNWpjOXJMcTJXWHpUak1CWTBx?=
 =?utf-8?B?UXpiejhHQzBJeXdCbk4ySi9DOEoxQjAyZ0dhQkpIK0xYR2M0aEZpYVdYWEhi?=
 =?utf-8?B?cC8zYWx2WjJGZVgxN3N1eHg4SVBTdWtWblF0aGJZTFY3QUxpSVZ5VVpVK3Yv?=
 =?utf-8?B?ejA5KzVlQzdrVXBLcHR0Z0N0ZFg0TnlwQ1VtOEdSTktLeW1VMDJLNmhNdnU4?=
 =?utf-8?B?YWtLbS9GMFZhamRQOW5kc1FtcTNZNlgvbVl5TlY2NEl1dU44azBWbFlyRmdm?=
 =?utf-8?B?cWd3Ulc0Tm8rYVUvMFpaNll0ZEJUMk9sTkJ0RGJjVUhOMjN6dzZHMHk3Tkpi?=
 =?utf-8?B?NCtxVnRyRE9lU3FzcHdhTjFBeG5uR0g0djRIQ29Qa1JTR1pKZmh0UHZvNkIx?=
 =?utf-8?B?QnFkVi9xWkpTK0IrZUNIN3ZQN2daV0JROHQwY1Z0MWtrc3FaV1dxK2tTa0dt?=
 =?utf-8?B?ZG1LT2oxUGEwSk02S01BMkk0MFlZQWVLUTA0ZFNoYi9HcUhTT29hd2RjUCtI?=
 =?utf-8?B?L1A2eTIxdWY1OWxleTJlUEhjRDAvYWFkNlJXRTBDVVMvbHVmdkxKTWZiRlI0?=
 =?utf-8?B?Ump3aS9VaXA0RVR0akMyaXBVVnF6b0w0YTZrTFNhVzU2WS9jelU2Z3ZSRE80?=
 =?utf-8?B?ZlE3UlFVMUUvRy9zZkZyd0J5Zkdib3UxQ1lTY3hhOWFwaXFmd0Izcld6bzJl?=
 =?utf-8?B?ckNIQWlsZFdEQzNQNjc3VzRlU0hYRU9mWjlPN2VmUDhUUUd2dG5rRU83alFm?=
 =?utf-8?Q?Y6zXZXPVN2pSCoDSRE3Y18s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWJwUWlnT3Q2NHdxNU9RZHQ5SkpGSmJaTmV3YXRWT3JKeHVyVUN2U1ZwZUdl?=
 =?utf-8?B?dWZ4VVNIOFdVUGJjTUdlRjIvTThpbm1MeEc2YVJBSnVaRFJZSGJYcStjU3Bm?=
 =?utf-8?B?eld6WlhGRkNLOSt0RE9COVNoM205VjFtVHMzd1RDWWJQbys5MzFxRy85RUtL?=
 =?utf-8?B?YmRldm8zdHVEOElZUjVIeFVLd0FCZExwZlZDNGVjdHVQMUJOWW5EVlNHODI4?=
 =?utf-8?B?ZHd3VHIyK2tkbnRTTFZxRngzcEtuR2Z3MEk2d1d6NU9SdGhnM2JQejgrWC93?=
 =?utf-8?B?VnF0SVI5THNYTHRmZUF0elZnWmRkMEJ4elpvcGFZa2cyK2dVVkpxOHdoVG0v?=
 =?utf-8?B?RCtZZUIydUJyQmZMbmdOd1RyRCsvaTJFWVdlQWdYZEFiRVRxa0J3eW1lZUpt?=
 =?utf-8?B?cnBTeHJJVk9mUTZpMEJESXhZUVg2ZWNqQ3VrZVl5OW5WQ0xwczJGdUQwSjBq?=
 =?utf-8?B?dDJFNVVRNU4yQUNKVGVBQ09QY3cxTHlrVzdDb0tPS3FFSjludHNSRHhZVnBV?=
 =?utf-8?B?Z3pJZG5VbklNakp5YkZ6NFV2am92RVp3b1Q3WWp1aGJIZnBDam1OVjN6QVQx?=
 =?utf-8?B?dHNUZ1BYbVdiVHJIVzFNTHlYL1IrVE9jcnNJMTlXRWhhQnI5Wi9DRC9LYW16?=
 =?utf-8?B?N2JzbXVXZkIrYjc0MzJzaVQzYjY0MmxON2JEZDRjcCt0OFFTaTF4MHdlTGwy?=
 =?utf-8?B?bDhaQ2tobHg4SDZVRmZja0dFV2g0MW5SUGNaSS9lSWVLNHlzTXZaVzlTQUEx?=
 =?utf-8?B?MFRxRDRaVUJyOFFZbyt3MlZxWHBOWVNubmpoVGlZR0thVjlCRU9EczYycmFU?=
 =?utf-8?B?b0V6RmpEUjN0eStFelhHbUhKbHFqUDFCWW1yeE41TXZSYUYzdmZJQ0xnY0Iv?=
 =?utf-8?B?QmtVTmZQU2p6Wm1aVTRQdVFSdlk5VHhLd3pqUndhdXBXZzYwaE9hc05pQUFt?=
 =?utf-8?B?OFZrMDI4Y2xJcFpBZHQ2Nkp1azI5aEJCTzhxd3lNM0RRVncvWUFyUTBXbUps?=
 =?utf-8?B?NGJxbXN6ak9FMjA4VmtMbkRoS1NxSjBBY3djNytydHFKT0pwZkhpako4UjR1?=
 =?utf-8?B?TXdFWXczYTVrMFZhVzM4Ry9WV0VtbHNZM1RQZUE2b0tBeXVUbEtMQ1lXTTBT?=
 =?utf-8?B?WElweWIyN1JZTk9IbWtDbW1LVmd2UVlKdEpibnZHNTlQY1hoZXFDTEd2a0p2?=
 =?utf-8?B?dUV4aUtOQzBxMmZia3lBeUV2enlMQ2hSVFR5N2tscTBkVUhRUWFRZzlKVUZu?=
 =?utf-8?B?ZzhuZEZ4Z01jVHFtOXZvTW1NZzdZUko0MVpKOTlCc2JMYkk3VmRnL2kyUElt?=
 =?utf-8?B?Z28zd0lYa1dJUkxLTWtWUTRWOThWMUcrZHhYNmF2enRJcG5BbFdQbzRBSzZ6?=
 =?utf-8?B?ZERiNi9NL25zRkQ4ZkV5YWZVcWNLREJWYzNla1NIUzFvd1YzakhwSldKVnVI?=
 =?utf-8?B?a3hIREhLMHFXdVhoQ3lBT0tUV2RmS2tjdmdmV0VZbUIxQkJLZHJWbDRac1Bq?=
 =?utf-8?B?c05XRDcwV2pkcFhuTHRwSWF3WnhlWGRhakdNelhUSmFBS24rbmhpYXREWFQx?=
 =?utf-8?B?WjZ5T1owRXBOeWhQYVVhU3RrZHJaOXFpVXpYV2hmYTJ3SWNuakIzUTh2Vi91?=
 =?utf-8?B?ZXM1TGh6alQ3ZjRwcXl2TG1ONVA0aVFPZkJRVm5xWHFNblhEOEZWc3UwMUts?=
 =?utf-8?B?SVIxZHR3MG5tUmFTMVZsM2V5Q0s4ZE9ZNkROOEdyblY3dFM3dDJtcmIwZnQ4?=
 =?utf-8?B?ZG51dGVBQ0JmR3dSNUJEcWdQeWRpN0YyZStqN2Znd3p5Q3h1UCtFOHQrZEtJ?=
 =?utf-8?B?SnE2Nml2TEQyZytaNUxRMFBnTmxkdTNqRlovVy9oQUVQZXpVUGNlWVRvblFN?=
 =?utf-8?B?QVQyTXY5NzNwQXZMS1QvQWtPc1g1dllqUUhMQlFROGV0T0lYNzNqc2w0Qlho?=
 =?utf-8?B?TW1Fd0VEZ1R5N1NIRU9na2l0RjlEcXNWbXFiVTU3cjRCRHNETVVQWm8rb3BD?=
 =?utf-8?B?YytZU0dEdTdtSkUxd3c2c1NmalU5ZWJ4SWNXejBiejVUc0NFaks1bmlHZkRJ?=
 =?utf-8?B?dkQ3ZVcvcS90T2xReVd1YVhBaWNJMG9EbmFjV0NFbm5lQVpTVXpNc2sycXRv?=
 =?utf-8?B?MkNuamNVNGFlZWF3ellnL05La0M5SExPUk5oSHlEeVFrWUduVXZFV0hvOXp5?=
 =?utf-8?B?QUpZVmNUNDJ1K05sMGIveE1CYzRtYzFhRHEvSHo1RGlUbjNrZ2tVSTk5QUZN?=
 =?utf-8?B?NGRoaU1TeUFKcUdtclRpSnR0Sisyd1VWT2hGUUw2a0NPSzJTZWtqWlJXWCtl?=
 =?utf-8?B?ZUlPZHlUMTdTMVhKb29wSURjcjMxbWdxMjdybURyaVpyRldva0pTOERRZUt5?=
 =?utf-8?Q?gZjf6ZJSyB1PyLkmd53/l0mzCEGQV1C3tw+vPY7dQyzAf?=
X-MS-Exchange-AntiSpam-MessageData-1: zSJ42l4w5kxEaA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e05c78d-dbc1-4fb0-4160-08de5e1631e7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:35.4921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H61OhWHeIDwTPLLTCSTI0A038RGFXB2y9YSVt5MeO3cSjAuKerYjBxPqF69/HNFb80rFTnjPLnPjzGJ5bhyovw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

Add an improved version of nova-core's `register!` macro to the `kernel`
crate for all drivers to use.

This is not a direct move from `nova-core`, but rather a new
introduction to facilitate code review and introduce features that are
missing in the nova-core versions. Differences notably include:

- Use of `Bounded` to prevent any data truncation when manipulating
  bitfields,
- Much better syntax (thanks to Gary for all the suggestions!)
- Extended documentation,
- Doccomments now build and run,
- Supports visibility and different storage sizes.

The `bitfield!` macro of nova-core has for the moment been wrapped into
`register!`, as a set of private rules, to allow `register!` to be
merged first while `bitfield!` undergoes review during the next cycle.
Thus, some of the code from v1 (including `bitfield!`'s doccomments and
Kunit tests) are kept for later.

Another notable difference is that I have removed the `Default`
implementation for registers and instead implement `Zeroable` to provide
a start value. I have deemed this preferable because implementing
`Default` for a register requires that each of its field types also
implements it, which is quite constraining and doesn't always makes
sense (for instance, what is the default architecture for a family of
chips?). Fields for which zero is not a valid value must implement the
fallible getter anyway, so we are not at risk of undefined behavior, and
`Default` can always be implemented on a per-case basis.

In order to avoid the ugly `Bounded::<type, _>::new()` syntax when
setting constant field values, this revision adds an alternative const
field setter named `with_`. Setters to not follow the most idiomatic
Rust naming conventions, so their names are open to discussion.

The first patch enables the `generic_arg_infer` feature, which is
required for generic type inference and used in subsequent patches. This
feature is stable since rustc 1.89.

The second patch adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. Third patch adds another convenience method to obtain a
`bool` from single-bit `Bounded`s, fourth patch a const accessor to the
interval value of a `Bounded`, that is useful for making register
setter methods const.

Patch 5 adds the `register!` macro. Since it falls under
`rust/kernel/io` it is covered by the corresponding MAINTAINERS entry so
I refrained from adding one just for this file, especially since the
bitfield-related parts will eventually move and what remains is very
tightly related to I/O.

Patch 6 updates the Rust PCI sample driver to use the `register!`, as
per its TODO item.

The last patch illustrates more largely how this macro is used by
converting nova-core to use it, and removing the local implementation.
This patch is to be merged one cycle after the other patches.

Previous work to extract the macros was done in the partially-merged
[1]. The current series can be considered a reboot with more features
and the `bitfield!` macro being postponed.

This patchset is based on `driver-core-next`.

Note that it also need `rust-fixes` to avoid an `unused_unsafe` warning.

[1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
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
Alexandre Courbot (7):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `as_bool` method to `Bounded<_, 1>`
      rust: num: add `into_inner` method to `Bounded`
      rust: io: add `register!` macro
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs           |  175 ++--
 drivers/gpu/nova-core/falcon/gsp.rs       |   12 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   15 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |   13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   17 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |    2 +-
 drivers/gpu/nova-core/gpu.rs              |   31 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |    4 +-
 drivers/gpu/nova-core/regs.rs             |  494 ++++++-----
 drivers/gpu/nova-core/regs/macros.rs      |  739 -----------------
 rust/kernel/io.rs                         |    1 +
 rust/kernel/io/register.rs                | 1287 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                        |    3 +
 rust/kernel/num/bounded.rs                |   79 ++
 samples/rust/rust_driver_pci.rs           |   23 +-
 scripts/Makefile.build                    |    3 +-
 16 files changed, 1787 insertions(+), 1111 deletions(-)
---
base-commit: 7c60d964fbb100103730db9560f5594c1c4fc844
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

