Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A41224AF0;
	Wed, 28 Jan 2026 01:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769563425; cv=fail; b=et9u0eR3oyYyu4PQMBBCf6X6BYBHH0YQLc6QRkIjc4WnzYgDalWPMtKnXBTonWZCTRgtzrHNeNChuYysQl0r/v6lJejefQrWpDz0r0r9vfen3UL2xPNJ/fS2McVKw6taU7gdgLNBlh4LTUrSwm/b31BU+FQNThxQHSRUEqRncKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769563425; c=relaxed/simple;
	bh=wFbkf9sgEGg92IzKpHfkNy9B4Li+qJOmVzNsN1sqryY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AN4IFy2oA0vidVhM5Ffhq+hoNoLL7OJE4w8pjTaaVkEB4K1HD7zpxm1w69h2L0cajGBBJVZFlfxUg4R6WDYjjPP2aEuewGXQTRugkujLZ7xCzXsKrGHais3Krvrbinc33bXbvG9pOFabaxgth4MefQNa0wNAMCwznmMy1UYUpOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dy0vvpJz; arc=fail smtp.client-ip=52.101.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dy0vvpJz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrCRxrN15WGNbgO3ekabP7BGzp521t0XMkzTCvgll84omAWg5A88OgfoXfqCo/04mrroqYORaG8SuTpKAwHyX3OtLEguOXmv4KalrMnhYKoqplHmYxG25yOkTMU9EujY/Ntp7Zw8Hr51qHLfJUww3de9UwusNHs87LX8bKbj1UTuDggdWJZmoJkcU7huGyETNyTnKWK9gAryC0TvUcsB70xGXwkcm6+1quOYEYtka791Cif3dTxYbUWQT+xwAz3riloU+QoRODuEHUfH7JOzOqza2Fo8Mumz2Pn6/dFwvG2YkvO7uPueNSdgDUhNhCd4/DIYnczBWwYqzJk6O8IhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw7zIuOTKvMzAI3Eqj69+SIOMzjtOtz4oVRg65Gecg0=;
 b=M6kAtvKJn490wn/5hrJ8dEU00FVOVsIWIrAgKjzdRtQjeS80ydbkmVEw+3IYzhEcen1zd0HH5sM+CTddFPskT1F4wENXhV0ehJPl86uFglqNv/o9CDixdrIwNc4BOjLI0dXbrLB2OYsSEf9QBvpnvPkYa1ETNsh1lL4eRvpLtnDu6YomrAFoMSNKRK8POKf+7y3d1jBGVuK1ETj0fCfWg5Vl8hU+eDVwWEv7sAYoI8SBpLehVbm0uRqRPfhPrElILsmSqvMkE5oE15B8vX417nIjEXDzwgzGRXEGn2n1qStF4AcJTHk3nFCkrFNZhXsRp2QCfP0l9UiDVGvCj9JWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw7zIuOTKvMzAI3Eqj69+SIOMzjtOtz4oVRg65Gecg0=;
 b=dy0vvpJzgqgQ45otK5Ud1xAE/CC3KW8isHPJhtY+5NkXOjigkD5x1UTC+1EW8X1WaU8HaPpPo25sM6AlYFCBjfAti0pJ/1oW7YtkorVsKjwzayuS1i12iYzYDNoJ4ZkQriA1Gdru3DTbvuE30THnihBL3kyaOkmOE68DYM3sQwMPTWhgEESEYyfRMvjrM0hbdF8WsTXqa/XKTmVQ5ffb0mS4I5kdVP4B4amlKOUwquMCSdLc8+K+//+vgt0w5FlFb8zAnuqxauUSTP21NNVWlUxLQm/RIlIgHRLOxTElKy8mrdWTPTdR5ghD3fkWuykR9IPujmPax8rziGFd/mrhCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8373.namprd12.prod.outlook.com (2603:10b6:208:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 01:23:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 01:23:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 10:23:36 +0900
Message-Id: <DFZTVMUBOHH2.39WYY2O0F48NH@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Yury Norov"
 <ynorov@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <DFZGOCV6VP2N.28M0CWIONBGMW@garyguo.net>
In-Reply-To: <DFZGOCV6VP2N.28M0CWIONBGMW@garyguo.net>
X-ClientProxiedBy: TYCP286CA0306.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: d64f6f6e-4fdb-4a20-5749-08de5e0bddf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SCtKMlQ4WjBDNnhYS0U0ckhlRXY4Rm12dyt4V1BZL21OR3pHZXF5Q3FoRGRh?=
 =?utf-8?B?ajZTM3pZMzU4R254SThDYUhBaHZEdUdvVlRpRmRBTiswTXpIb3FXRDRSOXBB?=
 =?utf-8?B?TnBqTjNsYnE1bU9iWVZQdDBNczlnOWlzNEVBaDNHcnlFb21IK3NnNFNxY3hz?=
 =?utf-8?B?VUJ3K3pPRERmRkpFMzFFaWI1RWtxN1N0QVhQVWUzNVNvRTdtbWZDQm5LbjdJ?=
 =?utf-8?B?UkJiS0tDUGRFRFFyVHBQb2gvcWl5azQ3UVYvVGlwS1o0aGVHeGdaT1FUMXlq?=
 =?utf-8?B?R2pGNldLKzIrK08zaGFwcVN3dEdMcDRaVStSZFd4Y3BFS1poUmQvUGtNWXZJ?=
 =?utf-8?B?ZmE1VTVmU0MvZnFQaUJsaDdOZUJyQzE3bWFnTkFjOWJuOFJFMlhMQXBrMGNG?=
 =?utf-8?B?YWl4aGJkendwRWpGK20rZUNNZy90VVVsOHpITGxKY1N5Wm53M1FSUmFlUnZt?=
 =?utf-8?B?NlU2U2R0WERMYW0vRWlFZDBVdjkxWnR4M3RSNG40UDJEUldzL29YenZCSTNH?=
 =?utf-8?B?Z1NlVHU3QTVBTUNjUUllLzdnaS9XRFNMTGUvcnJzOG1lOG92b2REd0xjV0Vq?=
 =?utf-8?B?eCtsbWtuSWxoeC9mN3J2OWpKQUxuUS9hRmVFUlhrUFF6c0k5OHp6SEkvUVZ6?=
 =?utf-8?B?NkEyWHVxL0pjcmtkUDQ4MHpUbHFPMkMyZ3dNT2lFNEZLcUVreUpMQURFRmEz?=
 =?utf-8?B?RGZ4R1d1L0hZTkp3cEJITG03TmhmZklYY0ViSXMwSDZGR1ViUXMxVGUxeHA2?=
 =?utf-8?B?d2puQStZbk1uZWN6SUtodURJRUcxQzhyMDR1U0tQT2Q1a256OHFjUE84dnE1?=
 =?utf-8?B?K0RCSHVOTDlYU2JHeFVBMm1kdVdvdzg1S2ZMOEhLVGc0aEliNXNpL0hRbjVM?=
 =?utf-8?B?L1U3dDB1cGd2c3RFeENvTEdhM2tCd2NmK1hSVkZaL2IrZldFb1drZjRnNUx4?=
 =?utf-8?B?VStHb0lyR2toMTNDY2xwSWpjaFFjQlJNeFB0ckRtU01XQ1ErMnZyaFNYS0M0?=
 =?utf-8?B?N2RlY2pHWFNtUU80ckEvQ2UzL3FISkNaeDNPOGVvVFFjZEtTMlcrQnBBU3lV?=
 =?utf-8?B?V0M3WGwvbi9kUDB1U3FtdEZRY08xdXJYZTdkb29IMmJwWlJ3cHlYbkF0V3Bh?=
 =?utf-8?B?NTV6LytsRmFMWnEyM3BKcUcxNmVBMWJjQWpqbnl0RFZsczNpdExaZGpQNDJE?=
 =?utf-8?B?Z0JJaUVESEhjaDdVNGI5RGFuQ0g5K3RRT0EwLzc3WXRLc3ZveWpwRUVraHpv?=
 =?utf-8?B?WHFYMjNJQ3N3YlJIVjdhWjMrVTI1dk9OYkFNV0ZLRURwWDlaRFpKMTEyc213?=
 =?utf-8?B?clFvZUxwT3BLc2lEMjZuUU9zMm8vVnRyR282UnRoY1llcnlvNU1JRDY0amhs?=
 =?utf-8?B?bmdsZFpxc3pKTHRuOFVlUHhVTmxESVZ6MTNUSW1GeUhVcDlpakxzalhEbFpn?=
 =?utf-8?B?bXkrVjFMWXFxTkhac2UrODVUYXZjOFh6d3QyS0hRRGs2SEcwS1R6MnJtdm56?=
 =?utf-8?B?ZzJ2Yjg4WDRtUzBTQ09WMEgya0hPM2xKa1FFVHdaOWxCV0p6ZGhvakxyRWpD?=
 =?utf-8?B?R3hWcFRLVWhsc0lmSldVbHd0VzFIMlF3VlNuRDVXNWVZQktHdFlvUGxkVUUw?=
 =?utf-8?B?WTJ0YlJqNi9WZGtOTXJaMVFOTDQxNDN2clNSRXJhbG1Dbm9LSXJrcUQyK1Bk?=
 =?utf-8?B?ODl2SHRGakhNdlpvNERLZjdnMVJUV2NWRFRoZWhwNnVKZ29LNUlIY05MUWVZ?=
 =?utf-8?B?Ny9IWitXcnQwVFBGWEcyRWgvODE5SUo2Q1NhSyszWXU1T21mT3YrOVVYbSsz?=
 =?utf-8?B?UUVucGxmY1BkV2lDeFZDNGN5VTVzbVRBU3A5UnZoVkZYQzZ2cW55Z1dZK2o5?=
 =?utf-8?B?K2N6WWJzelVFanBhbHM4dldqK2hhYkFhb054em1xSXR2MGtsSlNaOFRLNGVX?=
 =?utf-8?B?UUNwclIxdHRldVdZTjdYS2tvYWdOTHR0NEswSTUrV0Y2QkhORlIwVGdId1Ev?=
 =?utf-8?B?WURBNXAwNGtpV0N5MlVFaktKazVCcnRXQm1yaHRwd1RuZ3d1UTBKUmM0d1Vm?=
 =?utf-8?B?NW16aEFSTmRkOEs4WUQxLzd5MHJ3UUJQNkdWd1FIaXNMbStwVFlOdGRjRzBp?=
 =?utf-8?Q?Kulc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VoSnFmU3RzREhKcUdoVUxVMlp1OTF5RzMyODFINmM3emd0RW9GNnR2ekFj?=
 =?utf-8?B?Q1FoT0dEUGROQlNoUzlRM2JhbW9jTEtNUzdYT2FzS3E4SzBPeEhZSGVnK1pB?=
 =?utf-8?B?a205bXRWenN6ekJtK2xmd0tKQWdWRGQ5N1B6b3htL29Oa2IxMHhvTFpVMlJF?=
 =?utf-8?B?WnlFdHI1WWJ6TEI0T2VCUzlDaG1LNjBWSldWS3VMbC9ncTdwdUxGUzh3TWMz?=
 =?utf-8?B?MEFvUjd6czZERC9XeW5UMkwxTHBEdGovUTB4T0UyWC9ta3hTcmNpRjRmbWZ6?=
 =?utf-8?B?UTZYUE1nU1RiQVRpVjhyKzU2YUZLdVpMaGwybk9PcC93Nmk1cFFNcFI4MUJN?=
 =?utf-8?B?cnZ3RkFqY21BN3lEYjl3UzZmL2RGZHFTdWRoSitmdHg0d3d4TDZMalNyRWJx?=
 =?utf-8?B?bzlSZmVBVUlLUE14Ym1GV0FUMHA4aEhyMzVmMHZIaStHTFpUVWNMdVpPaURS?=
 =?utf-8?B?alhkZXl1SUYxR1pUMkhOcS9yZGRlank0TW9CV0d1cCtCRTllUW9SdXRFMXI0?=
 =?utf-8?B?UnRqL2FXUVB0RTlpbHNzV3pXemdoaEg5dHZTdXc2WFVDYUZsTmszU2EvSTd2?=
 =?utf-8?B?K090WE01bjB0QlZMbDAwZ1Q4SGRvc2RuRlVFVGMyb0s5THhMaVZVcWNLdHJw?=
 =?utf-8?B?SWVZV0RqZUxvM1RHbkF2enoyYVRPRlF5Sk83TG1GTnhxdEVEMG1jZWRDeFBK?=
 =?utf-8?B?c2FvendmZEpEV3pwZTZ6a2FCZ1M1N2lQYW5JZ21ONnZBZW5GRVcydHJCTkVU?=
 =?utf-8?B?NkRNWU54SzVzWHpCaWtoNmlHVUlaZmJWZFZKUGlGR1NtMXEyUm9pZFZ5SmFO?=
 =?utf-8?B?NnVkRDdQVDg2MmkvV0JzbVNpUmUrN3VwSmxKU3puZGZUMFF2UDV6OUx2cTVO?=
 =?utf-8?B?aktVaTRsbTVtSTV0Zk05aUhYdE1WTzVuNWRtU0dRZW5vRmpMeVhySWNwR0xU?=
 =?utf-8?B?U2ZVYytpeHhVOXJRcHMrbkV6VTBvaDlGbGZUVkt5SlZ3YUZLRm42amwxYWpv?=
 =?utf-8?B?bEU2dFRoZjB0bmR5UmFjL2VOZ0FwallCOExuUkh3ZStDL2s1WUtRUS9hdStR?=
 =?utf-8?B?ZUk0djBHdDR3WDdmOWlkRkZCMmdBb1d2MHpMWTZ4MXhWaDJnVnljWkNkWG1V?=
 =?utf-8?B?NlFhZmlDdEhuekxnZVNnRVQ2ZWE4S08xRWR4ZnRiWmlQNkV2eG96alowRE1P?=
 =?utf-8?B?UEtDNisyODJHejdKbkl1MFJxMXZYQzYxR2g4OTFCMWdvQnJJQmIxcDJkek5H?=
 =?utf-8?B?elUrSWlqS0dRTkpxa2VqNkdMVUNHVnZWem1EcHVDWld4YlJBOG9zMkI0OXJT?=
 =?utf-8?B?TTBYNUJiY3VhdUtYUWRubi9RYzdNMEI3ZEE4M05ML1NCZEREMzd6UllYa2w3?=
 =?utf-8?B?aURKTkFrRmlsL3p5alBKaTZIejBhby9MSXl4VGQwU3BHSTRndnhHUjNrTHQy?=
 =?utf-8?B?R0RpdEd0Y2NsbU5rOTV5aEJWbE1nYmdCK2NPZThiL21DM0JLNkJFWkZvWFdt?=
 =?utf-8?B?YVU5eGR4MVZCTGRyM1RNMStiRVRmc2c1QmU3V1RxQno3N1B6bGN0a2Fkcm9K?=
 =?utf-8?B?Z0tZQzdIR1ZTL000Q1BYdDFNSWdhWGtvV3RsSlVsTVE4MkNUMjZGWDloNmRn?=
 =?utf-8?B?ZDUzSm5JYkpwQWgvRi9Xb3hIeFl6TTZ1WHRURnFEdWtHT2lvaDB0R2dlSmls?=
 =?utf-8?B?ZzR0ei9PQmZUZTRMNVJ3YVVaNzFXUHY2VXZ2MTZuUTI2RTJUMVFrYjRncTVH?=
 =?utf-8?B?TW1Qb2NqVGxaWm81WFp4V3ZIWndNOUZCUnpYRm11VzdQQUEyVHZvQWhaSEhH?=
 =?utf-8?B?WURzbDZiMFZQcmdCdDVyUHJrak1jZjZZUFM3NFY0bFVEeVFNWFZUVm1aMjBz?=
 =?utf-8?B?Qjd5VlZWb3djN3hHSmpXNURlSGYvRnRZVXhUMXlpUnU3WUc5NmRYL0Zmd0JU?=
 =?utf-8?B?MjdRNDdqYlArZlJFME9udjV5ZDk5SjgvUjUzR1NtenYvNkpwWjc5QkNwRjRw?=
 =?utf-8?B?b3gyNlB1MVBHdUdBOTNrakVveTJqQ091eTNncTF3UXoxdkhjTUtGdjEvVVAv?=
 =?utf-8?B?aTdlU2JCN2IvNmxvR0VzNHZ1ZjVvZ0JBYzFkM0JJaGtDTXZUTVNiV2lIM2hO?=
 =?utf-8?B?TWY2UURRaDZpVHllYWxPdC9VY3I4dElwSUQ1S3FSM1l1Q2tBWlF0eHBjVWIy?=
 =?utf-8?B?U1NOazM4ZHVNR0pGYXpLMlY1U0R0eWdYT2U2QzJIWisrRTBRSTRPZnZzSXdy?=
 =?utf-8?B?RExwZk10cExIRFBCTkErMUw2SFcrL2kvdlhxMThEcXcwQ1p3U1JnOUt6VHF4?=
 =?utf-8?B?bk15K3d5TUVjWFJFV3YwKzd2TkZmbWRaOWNnSHZEUjZtNFFrRisxam9PUGxY?=
 =?utf-8?Q?knTUi1r63OdglvjulRQBqEsqaaoftX41DvhHzD3LMl2rp?=
X-MS-Exchange-AntiSpam-MessageData-1: lqs0dpc+ndA3RQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64f6f6e-4fdb-4a20-5749-08de5e0bddf6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 01:23:39.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hQOSMhf/XTEkqw+qsY+flojyjqOhZzWS7BCLWDG10HxNLKJCklHvXWZVzk60iZHUBRPb2n6TG/tYbXgaLo1TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8373

On Wed Jan 28, 2026 at 12:02 AM JST, Gary Guo wrote:
> On Tue Jan 27, 2026 at 3:25 AM GMT, Joel Fernandes wrote:
>> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
>>> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
>>> > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
>>> > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
>>> > > > Add a macro for defining bitfield structs with bounds-checked acc=
essors.
>>> > > >
>>> > > > Each field is represented as a `Bounded` of the appropriate bit w=
idth,
>>> > > > ensuring field values are never silently truncated.
>>> > > >
>>> > > > Fields can optionally be converted to/from custom types, either f=
allibly
>>> > > > or infallibly.
>>> > > >
>>> > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> > > > ---
>>> > > > rust/kernel/bitfield.rs | 503 +++++++++++++++++++++++++++++++++++=
+++++++++++++
>>> > > > rust/kernel/lib.rs      |   1 +
>>> > > > 2 files changed, 504 insertions(+)
>> [...]
>>> > > > +/// // Setters can be chained. Bounded::new::<N>() does compile-=
time bounds checking.
>>> > > > +/// let color =3D Rgb::default()
>>> > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>>> > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>>> > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>>> > >
>>> > > Is there a way to just say:
>>> > >
>>> > >    let color =3D Rgb::default().
>>> > >            .set_red(0x10)
>>> > >            .set_green(0x1f)
>>> > >            .set_blue(0x18)
>>> > >
>>> > > I think it should be the default style. Later in the patch you say:
>>> > >
>>> > >    Each field is internally represented as a [`Bounded`]
>>> > >
>>> > > So, let's keep implementation decoupled from an interface?
>>> >
>>> > That is unfortunately not feasible, but the syntax above should seldo=
mly
>>> > be used outside of examples.
>>>
>>> The above short syntax is definitely more desired over that wordy and
>>> non-trivial version that exposes implementation internals.
>>>
>>> A regular user doesn't care of the exact mechanism that protects the
>>> bitfields. He wants to just assign numbers to the fields, and let
>>> your machinery to take care of the integrity.
>>>
>>> Can you please explain in details why that's not feasible, please
>>> do it in commit message. If it's an implementation constraint,
>>> please consider to re-implement.
>>
>> If the issue is the excessive turbofish syntax, how about a macro? For
>> example:
>>
>>     let color =3D Rgb::default()
>>         .set_red(bounded!(u16, 0x10))
>>         .set_green(bounded!(u16, 0x1f))
>>         .set_blue(bounded!(u16, 0x18));
>>
>> This hides the turbofish and Bounded internals while still providing
>> compile-time bounds checking.
>
> I think this could be the way forward, if we also get type inference work=
ing
> properly.
>
>     Rgb::default()
>         .set_read(bounded!(0x10))
>         .set_green(bounded!(0x1f))
>         .set_blue(bounded!(0x18))
>
> is roughly the limit that I find acceptable (`Bounded::<u16, _>::new::<0x=
10>()`
> is something way too verbose so I find it unacceptable).
>
> I still think if we can get=20
>
>     Rgb::default()
>         .set_read(0x10)
>         .set_green(0x1f)
>         .set_blue(0x18)
>
> to work with implicit `build_assert!` check it'll be ideal, although I
> understand the concern about the fragility of `build_assert!()`, especial=
ly when
> Clippy is used.
>
> I am planning to at least improve the diagnostics when `build_assert!` is=
 used
> incorrectly and the build error actually occurs, so hopefully in the long=
 run it
> can once again become a tool that we can rely on, but in the meantime,
> if all it needed is an extra `bounded!()` call, it doesn't bother me that=
 much
> versus the full turbofish.

I think having a dedicated const setter method is better though. On top
of not making use of `build_assert!`, it can also be used in const
contexts to build const values, something that should be pretty useful
once we extract the `bitfield!` macro for wider use.
