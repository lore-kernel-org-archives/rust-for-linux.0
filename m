Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BFD3396E0;
	Mon, 26 Jan 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434144; cv=fail; b=RBcEzHVheWFqbapBvowvmq/X1FLOd9uNidrSMngKy1SJSStyNqOMkL/HB0gXaFHhIZo0xapMtlR1z9vZyy/h5lvwdNSvVCNSs998ZIrLa+2FwU+Kv55zcT6iWMvYmZmY8EqQHictcpTJt7hJF0IJNjLR5t8KJ2S0u4oQ79pp8BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434144; c=relaxed/simple;
	bh=8RU1FAXGEgfk3ftg36NhcpUcYoa6/fl6y7rHJujq7t4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AIixlzza5JgZX5RQ2byhzK5PaUv/L4YqOhEUMx3mZhzP+SYJqTdGkLJSjDaoWlpT/iqjoZjXxYcsA5CgIBzc4KwoJHfzb2Fxpp/dLXqraMTDn7EHLG2hHZYxQFspJFAq7GY06e/kvoMol9fDKlEJw1Hf6Bz3x0uH/L+iEs4OEfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qb2X3Lrs; arc=fail smtp.client-ip=52.101.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qb2X3Lrs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTY6oTiHUJk2lPPJiSRYGMNuJSCb31BnkZH0s8fm48E4g+0NRMHnoRO5OsxR86HXRsd8lOu7YPp7cIACQRTINZtM2uFXxG4yPgU9uR8XPt5FJ5Ax311ehVHABgs+Mo+gfPtNzt+QlPAF4jJ6NHwY3TXkzp0EXRQnkuJhJ8r2VLdMPntw+I83k2wDFs3y5RoxJd5TNUK9LqqRWUoqnlAOmUNKsvJQaB0/JZ7OhtSeS5hC1EYAK/8DfvVkBjj9wOp7ZjgE0oBkoQN4mRx+9m0pmtpWasd6Ua1EknmOcy6C4ES/p5TrWFCNfXzgdGTRod6ymeYw96JJKPYPWw+wj3DR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deA/g+4rrEgg9Dh9OvUykxnB3e77qT3TUPF93UX0aeM=;
 b=Pq2F0Fh8u93cYwJRWqTkBbbYvCkJp0XxNooQMG5Gw/tCllLu5WDS0aTrS12a6LjN3+3KuoMZ9saD3ekTR70OSqC5HyJ+nduDNCKuh3/OX9w2wnuLu6Oq6v2MQDihEhY0klExP1Ny1KLi9BRrUptG0qEUE6fZauuzlyISKYqHzairMpB1PydCnNYWRsOIHUJygfenIZnu38nU4cIVHahRBfUmCLn4gA3M67lNZFdN/bs3krx+FtpO2/GTcaBAOrN8lsERw9AQn9EpJaGyLiNN07RnbcO+43Fxt89XM5ZCQCmFJR+wmElhSIPF5XiaIMM60aQV0P8AdKs3gGf/EGlvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deA/g+4rrEgg9Dh9OvUykxnB3e77qT3TUPF93UX0aeM=;
 b=qb2X3LrsOzN/Fg/IRPBs8/GpM1xTc8KSYVywsUX13cFaUr7dbZ3p9HSyZ09oyvRIiYnhyirV4aXVNw41BPDIkRsUH90djazvKeo69PmWlNFa6rqQTatVILqfmItAZXAaphBcvO7vs50NrUnXPw8BfVRRXJCHEZwJkbiRZtRuNFiXXTDffooHvcllXXxpsRQeQN+jaLtIBsCBK/NnSlJMtW1Hdq3Ryqt10UbHQHw/NIK7tI3hC8TrRnCNLaM2WOUOtyVomVsTGo8EQkjeD2Y2cd/0o37HmFh57FeMdjZqADSflUueq0ospjPQgCpCyfaCj1std4+f5FFYwanyc6kPyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:28:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:28:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/6] rust: add `register!` macro
Date: Mon, 26 Jan 2026 22:28:39 +0900
Message-Id: <20260126-register-v3-0-2328a59d7312@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMQQ6CMBBFr0K6tqYzFSquvIdxUdoRZiGY1jQaw
 t1tiYm4fD//vVlECkxRnKpZBEoceRoz6F0l3GDHniT7zAIVNgrAyEA9xycF6ZztLHgEA1rk+yP
 QjV9r6nLNPOTbFN5rOUFZvxFUv0gCqaRBbcEcdFfX5jwm9mz3brqLUkm4NWFjYjFb33ZHX5Nu7
 J+5LMsH1DAfW9sAAAA=
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
X-ClientProxiedBy: TYCPR01CA0161.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dfe7bf-df29-45c4-a895-08de5cdeda4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkJFMEE2cS8zbHBrcVNDNlp4VW8vT2d2aGJsNmhRK3dxQkppSDVyVlBWZlN3?=
 =?utf-8?B?MFZTYWJuemp2b3JCaWo3ci9tRWRZZ1lRNzEzWjBPV3hhMk4zemlGblNwc05N?=
 =?utf-8?B?d21uMmxWdVVWcThvK1J6S212WnQzR0lMRFBJSVJOL3lJY3k1R0k1aFBLQ0tP?=
 =?utf-8?B?WVMzRlJ2bzBvOGFPR3pVcC9mU2N1NDhFRHEwYldQM3dFWWY1Tk1Bdy9wQ0FT?=
 =?utf-8?B?SUNwY0JSVUFTTkxBY09XYjZSSnJ2SDZVRnM4bjJ0WE9tczZQOEVvcWxYS2Jr?=
 =?utf-8?B?TSszUkhjR0dvaldtVHJHeE1rL2NiTEJkbWdyWG0wWFYreENTazJCRnI0MFJa?=
 =?utf-8?B?TWxPRnJLcm5UdU9wY2hHcSt4NStoNEMwc3haRmZFTk1FSWlEN3kxY2dzbXM5?=
 =?utf-8?B?SUZSV2w5VUQxQml4eThPVlpNbzZlNEJkdnlDeXYvRFJtTWlJNjV0Rzk4VFJM?=
 =?utf-8?B?aDd2cEw5Tm40SFFCRFBqdm9oczkxbk1aTHhYaFhaa0pvUW9UakxpMEhVZ29l?=
 =?utf-8?B?Tnd1dnJiandmYzUyY0VrSUtqSTJEbGN2MVc5YVJzQ1NzM1FLL3ZHZmwzS0My?=
 =?utf-8?B?b2hZekFyTEgzaWg3WTdadlhUSGh6eGNnR04yaWFNWm9oV1FmbUFwcEhhV0J4?=
 =?utf-8?B?VzUwODRBNW5iYWc3enJVTHR4UHhNeXlLL0tiQVl3T3JMRTRncXc3VW5MeWZ0?=
 =?utf-8?B?TkRPUkxMT2ZLcVgvOUZ4WlZZWFREYzhvM0hlNDJwR041dnMxMWtNWTdSTjRK?=
 =?utf-8?B?K1g4dG1TdEpJeCtZNGxFQWY3ZlIzTUtNMVcxUlV6b29QQ0FhdUpVZjdrR2RN?=
 =?utf-8?B?a2dJaUJYdzdlOVlaWjY0by8vYmZ0VDA5QmNuNUhCTE0wbnhKMCt3UW01UkNq?=
 =?utf-8?B?MVlGamREVnNQekcySm9DbW5GbWZzaCtCZHdiVkNzMUxBZTNSM2pUbEsreERD?=
 =?utf-8?B?ZVVIeVg5cHpHZ1pWZ21pSEJ0NGN0aGtUOHNqa3NkMm5SS0VJR05NSkp3OVRH?=
 =?utf-8?B?K0ViTldJWkdWaTQzMmQ2YWhqWGFjWDRoOU52UE5MZytzckxMVndISHJCa3la?=
 =?utf-8?B?TnZKZVhpd2xhKzRtbXE4N3VENjVURnhTTUF1NzF3dHViMEpuUTJESlBrZ20x?=
 =?utf-8?B?bVZmc3pNaTBMZnVVWjh6S040dVY4RmVkeG1BNUdOQS9hNVdwc082VzZXTVZv?=
 =?utf-8?B?Si9uajBlUUJIcjllbWV3NmRWaTE0VC9XNXUza1ZMMnYvWjE3dHBQY3RvRFF6?=
 =?utf-8?B?czRmdW50c0xUZnhwTlF5cC91UFg0NTlFa0VjVWZ6VDdyMlJneGgzYU1temJ5?=
 =?utf-8?B?OTNDRjZvUk56SjhaMGRTK2dNUHJQa3I5Wm1oSGswR1FrWWNRSFd6bG8yOGZr?=
 =?utf-8?B?UlZNV1paWnVmK2g4VHNsaEZFN0RSeEcrZGs2TVdOK0lIRGZKRFhDUHJpZm5T?=
 =?utf-8?B?Qmt3MEpMaytCNTArMXRUOUlocm1hNVQ3OW9VR1cwQTNwcW04YU9UWlNtRkdy?=
 =?utf-8?B?SEtHRlZoVitkT1Y0bE5hZzVWdmNYRG5HUkphUjdPVGxmeVpwTmpDcUZNRndL?=
 =?utf-8?B?Z29jaVVjN1NKYmcyNWliSVpyUkhDU2FqNmJ3cDBzTkpXeUd0Y2JFZlVQTHNS?=
 =?utf-8?B?RUwydVJLQ3BCWEtWNk0yTnFZSzh4UDIzZzF1ZVg1RHFjdmVXRTcxeGg0bitD?=
 =?utf-8?B?L25jMjJoWENxcDdtWWdIejl4dVh3ditBdjlsNnVTcm84Q1pMMVByTHg0LytT?=
 =?utf-8?B?SVVKdlo2dUd1K0RSa3ROSXU5ZVNySlNBMXhRSnRPYnloSlZ5VWNQVkh0OU1Z?=
 =?utf-8?B?Y0JUcHhkRkJCcnVBVkp2YlVEVEZxeGJmUGtmNVI3bll4U0NwTFZYQ29ORnU5?=
 =?utf-8?B?MHBnbkI2aEgxemtWUW1jbEdHWlFQS3Ryazd4aThGcW1GTGpqcjdGTHhoeG0y?=
 =?utf-8?B?WStjQUIxZ2UwK2dZR01qNnFwZUg1NnJRK1grRFZqWi93Z1pweXNWUmxEaEM0?=
 =?utf-8?B?SHNpUTR5OWRGRHlqQ0N4ZEY2ajNEWWNMQ0tRVTdKcjFQRmIvd2VieGIrdHIv?=
 =?utf-8?B?WEpaSzZ6SFpLak1MMzdHdDlzaXJuVkpVMG44b0RzZ2VLNzF0elMxZzJqY0tz?=
 =?utf-8?B?bWx1THAvRGJXZDIvd3ZndmZXeWdXT3creVd5S3BnaXBsb0orc0F1bTBMei85?=
 =?utf-8?B?MXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2VSTGthdHlFam1tTmVFR09mYzdta0FHRDRheWpUaktxSjE5SDVYa0FqeVdO?=
 =?utf-8?B?NmVkdThNODVHdFNnRVZPVkU1MTB0aWlTZ0RuUUd5eHRtVDY5T0JGZU5xMTZK?=
 =?utf-8?B?M0tJVG84c0RhK1FLWUVhRWdBUlBja21nNEs3MUlxQXVQMDY5Nm1Md1d0dU8x?=
 =?utf-8?B?M1h5VC9ZQitqS1AzUWlPL3JjYy83Y0duV1QvZjhqc0N3bVlaSmNYSFEzckVw?=
 =?utf-8?B?SEFkMkQrWGpQZUtTNWZkQThRUHNqOE4zQjFEUTFIdjJoYXJYbnQ0WTFHVmsx?=
 =?utf-8?B?VG9aNGloRnI4SHg0WGZheGlyS3NlQlNndmtIazdPZjk5RjNTUU5wOGNFeTB0?=
 =?utf-8?B?K2pVeGdNK0ZvVnF0dGFIRzlrTHRwbEtVZDFVTnB4N1NYUnowREpsTCtkU2lD?=
 =?utf-8?B?SnpFbW5nTXZ2Mlp3QUJiQVlkZzU5dGhocHBMemEzdmVpNW1qSVB1TXA4QlZN?=
 =?utf-8?B?RDQ1eU9jODUvZk1WM0g2dFhYN3VhU0ZDNEptclBnSDgzSFdpVXN3SHJNRnNK?=
 =?utf-8?B?YjNSMnFudVZWZytWcFpHY1pXb3FQKzZvWWphaE0wRVh2VFpDK2RyNjhLNlVo?=
 =?utf-8?B?MjlFcXM2V29KbG1nWko2RDl3MnlyODlkL2pWdkFHbmkvaFV5bjhEWW1hRWFH?=
 =?utf-8?B?Mk9zV2xINFFYRCtDU0xPL3JWR0JMMDY4NmdESnU1TGIxSHF2Vk9MSzdIdkd6?=
 =?utf-8?B?eTdvS0ZHMHVPRkhkRC8xRERRU01yL1drTHJYTTNDN2VrRVltb2RnUlZCVUMw?=
 =?utf-8?B?VTJYK0tFOXlkWllwNG54bzRWQlRQSFJiWThDc3k5L21JTUVHbHA5bWk1SlNw?=
 =?utf-8?B?cjcyNm9scUZiQ0NveEZ6bjF3S2lqQUxjckJRMkRWVWZUMDlXa2lUeWw3cjZp?=
 =?utf-8?B?MG00dWYyNE82ZldqNXFkWmUvVWZBK3MwZGJMOXFWWFRINlVUQWsxTGxWV0Iv?=
 =?utf-8?B?RjFkUFdCdEdDTkh4LzdMaWNWcXhiekNGUFVqV25UQkw5dEFrRE1kN1drV3kz?=
 =?utf-8?B?YVpNNnRyZU9GVnJJRDBpL1pXaDRRK0ZpU1ptREhDRklqRzBtTzN4UkxObHNL?=
 =?utf-8?B?NEROQ3FtZHpIS3VyVjJkYjRqcCs4NjZWV2cwVGt6bHdWTGhiRnljRkNmdFp1?=
 =?utf-8?B?SzVVa3ZTV2YxQm4wU2NsUnhaTWo2M0ovT04yK2RCaG1jUW1SdEtyK0tsaTVh?=
 =?utf-8?B?ZkRkMWRLVkloZ1hlRVo2VHlYRWxKOFgzc2pKK3R5amViNjBleU9IWXVIRkJl?=
 =?utf-8?B?Nk5idS94aVpuS1dSYmxPUU9MWGhmblpadXl2Y0VFbGF0NDhSWXBFSURPVUl1?=
 =?utf-8?B?SkQwRlZZczNYWitJYjZhZDhjb1ZneUZ4NFBYRzYzNjQyWlRXdkdtSC9mSkVM?=
 =?utf-8?B?aGx1THQrOUNkOFpiU0lWUWZGSWc5UFdtaFRkSmhFaFpTQ1hqU1V0aW0xdkxM?=
 =?utf-8?B?cUNNR3Erd3QwNGVmL094ejhmblZxOWdWNHAxZ2pFZlFPMHgrbU4vUlB5Z3ZV?=
 =?utf-8?B?UWZSMzlHRnptWGlkZUlnUlNPT0dTcUFkbDA2L3BIS2p4UC9jeDNwOVZVSFpp?=
 =?utf-8?B?M0c0SG43dW9FS2crd1VIa25zU1hmTGQyMzd2OWYrS0Q0SnJhUlJkWUIwTzNm?=
 =?utf-8?B?RHpVRzRZZkY1ZEFoeEhraFhmK25DcEptaFk2OXVHWVc4bjJuMGhqZ0dCWUk0?=
 =?utf-8?B?dzNpZEdacWFodlA5aS9IR0h5QTgyRGc1bW5DZm1jR1dhMkZXMUZIWVcxeVV4?=
 =?utf-8?B?T0hUYUZYTUlxWmtXdW90bkU0bEVtSW1qYzFOY3dSL2wxcEpRcVJWd2JteDR3?=
 =?utf-8?B?UDlRcnIvK1ZRdExQSCtoZ3BLSnZBMEVUUGVpR0U2ekIwT2FoTXZlTWQ0OU40?=
 =?utf-8?B?czVxRlFmbzBQY2h1RjZOVDZyaSs1Mk5GMUFBZFFqY3hGbkdXSlFSRWJ4Zklp?=
 =?utf-8?B?N291ODRTb2t6ZHd1Tno2bFdQNTVEbHd2QkZ2bVRFWTFERURhNXVWVndDZzRt?=
 =?utf-8?B?MHR0ZkVTeTUzZ1VTRFlHYmhtQ2ZINkRwc3BKT1BNakNYMnFwT0EwcEhVWlFR?=
 =?utf-8?B?aTUxeVRMQ0JqOHhmWXIvRFFrMFJPN2t5Rk43ZHUvSjhkUE9nL0hPZ0hJc3JV?=
 =?utf-8?B?MDVSSzg5UE9qcy9PY3BQTDRDWTR3VC9oS2VUeUNGNlZONlZFbGFiQ0RvSHVS?=
 =?utf-8?B?ZWlaUHdiSjdzS3FBRjBFcFQxYU9OSzBMY0FjL3lUNW9lRDZHclIvSzZmMHNi?=
 =?utf-8?B?eSthVW0zYWVxNHNPQVNLbFNxVDRUelBqWlczYWlGYU1RS0d1TUF3cDdXRjI3?=
 =?utf-8?B?WmlCZGdBc1lOUHliazl2eGtsQU5mNm1xeStuZG1OUTFWdFF0c1NRS2hvbXc0?=
 =?utf-8?Q?+tCtIp1bHiSvdEl5oUJUoyee+3W/m2EDL37KF52YlSwbk?=
X-MS-Exchange-AntiSpam-MessageData-1: wZoJvqua/vsOiw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dfe7bf-df29-45c4-a895-08de5cdeda4f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:28:55.1193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SScsnWJ+p3HKgZWgWuXuBCvai8bTyUBlEIBqmTWX7IVDegAT1euk3Zyq1pA+fPSqceRHMokGES70/LTeJgeYbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

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

The first patch enables the `generic_arg_infer` feature, which is
required for generic type inference and used in subsequent patches. This
feature is stable since rustc 1.89.

The second patch adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. Third patch adds another convenience method to obtain a
`bool` from single-bit `Bounded`s.

Patch 4 adds the `register!` macro. Since it falls under
`rust/kernel/io` it is covered by the corresponding MAINTAINERS entry so
I refrained from adding one just for this file, especially since the
bitfield-related parts will eventually move and what remains is very
tightly related to I/O.

Patch 5 updates the Rust PCI sample driver to use the `register!`, as
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
Changes in v3:
- Sort the Rust features list alphabetically.
- Rebase on top of latest `driver-core-next` including the new Io trait.
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
Alexandre Courbot (6):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `as_bool` method to `Bounded<_, 1>`
      rust: io: add `register!` macro
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs           |  175 ++--
 drivers/gpu/nova-core/falcon/gsp.rs       |   12 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   15 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |   13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   13 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |    2 +-
 drivers/gpu/nova-core/gpu.rs              |   31 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |    4 +-
 drivers/gpu/nova-core/regs.rs             |  494 +++++++-----
 drivers/gpu/nova-core/regs/macros.rs      |  739 -----------------
 rust/kernel/io.rs                         |    1 +
 rust/kernel/io/register.rs                | 1234 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                        |    3 +
 rust/kernel/num/bounded.rs                |   63 ++
 samples/rust/rust_driver_pci.rs           |   23 +-
 scripts/Makefile.build                    |    3 +-
 16 files changed, 1714 insertions(+), 1111 deletions(-)
---
base-commit: 1cab0874875a1c37f71edf1e1e3029b1cf31d81e
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

