Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7633A001;
	Tue, 16 Dec 2025 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873505; cv=fail; b=S4PeKCjI0APgLxQZrd9AJ3OjoT236c3BhYbzbUU48HQAEQeMjIeGit5EbmCKhMxBigvXuFJbkFXorEOlO98BGfhopMAe6Ml9VsKTjY2jnvnwIqMqwy2lNwXyHThkrYVXqDpdQYFJ8d72k7LwQbCjuA72AFp3NcP6HjbugrMoZPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873505; c=relaxed/simple;
	bh=tPAaGLDBoA5OMZhT+NBZli00lzJB01hpsiUbgFg7VHc=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=L377YOQtmzupewmGzq0n5M6bbO7ZOH6Guq0ubguPm8TGitr1XH6xwWkLA6MuQ+MBAwQ5xcqZBYlHYbd07ylFYmgoxxzDUXpqA9epiR4JLYpVNOXbPoiTHtch9kDfH5AOM4os4JgX37WXY3g9iiY8V3SOpPS8C+E/+WupmOAboS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a+Ks47wR; arc=fail smtp.client-ip=52.101.46.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a+Ks47wR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2at39qbXssJBoc56rubVqabfIxrxVGvR7ILK4emNWEsjb3Nc1kK2mpEI58E+GcM/z5zP9AhKBldui5ju3vJliOwC3D0vulyaDuGlA3TgCEgMZZHdKDgTQdFocvCymOEu8l0GyGTmeqa7ZJNzRiBPoxZXyL+7YzHEoeuiKvo44Jg8MPZHROvj1gbuj4M4h3AfQfZFiqTMNEDYdvhbVU057oFmWpmgXpB0Jfe0pqrMF4baBaQAcwoIqof97yddqXrZYuZUPGNaW9feAHIGg8ZSaKi/zA0LTxLDO9DljIgRbBlPcWspL+YmPj81x385I9n36pI1PmwdNvNvWHWLLaLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYZfJ5EFDj6xZyoFHmD6s4nEovL/uZEcEkqbtwbE+Cc=;
 b=A8CiW3Ooj63aOAb7fWy+0nFTk4t54W7ivt0lI6o3tfeTFkJgzq+GbwATPKc795VgBWAR0D6L0B46hUAnMCrva8Fz1V4QMnBMkV2yUDuDZuDiSQEpsc6JW6IVh2zVE6kbZ7MLl6QF8Mkqf5ajWWIxaWc2IxteF58Hi6ykN4f9f+ggq+48usZJVYy16ik1WOxpA+KKVbcTK/0dzEYGQDEi2gNHpGuco2dXmeLlvxHNzuseh52IZeN0Kc62vxE++SN+ySK/HZhuzoMRZUk8wBQ8Mu/9yol8PeblQQG7cP4U48quFWmLJo6mylJ2pbw2rfiSM9/1W4oeP46kwGpL02zUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYZfJ5EFDj6xZyoFHmD6s4nEovL/uZEcEkqbtwbE+Cc=;
 b=a+Ks47wRjn+tCMbt1r4hgAunhipieqlqKhJeTPzFLF1nnv3YM8wFb9NQHabDr95vj6LBmFzExoSXhYf9qoK7+EmB/2s0tSnwv7Z8DXB1z9X++hhSogcbOzVVL2zDG6T5GWQ7b1PBjbcszE1lG58gB8V7e0nn8rJv/sDwoPNm8sy6UPfTdlPkz3QsFHObM9NHbKm08uTV7Uk2AcbfQIRuhlrYKBe98NXuMZXGi7Piu0Btgrk2D0eXYuWbUtHRPqL8wLnfJ7a8df1uomJvwKbsmU3C71S0rEm+mhchn/uwjcaGqxx3lUaRn0yAVxnbpZ2BHNhp3uc52KwGfM9l8EynWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:24:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:24:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 17:24:49 +0900
Subject: [PATCH] rust: ptr: replace unneeded use of `build_assert`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAFAXQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3YKSovjEYqCuEl3jFEtLSwNzS4uUFHMloIaCotS0zAqwYdGxtbU
 AhsiaPFwAAAA=
X-Change-ID: 20251216-ptr_assert-3d9990798dd7
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d6197a-1510-41c0-f999-08de3c7c99fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZllEZmdrczJCNDJmZVlkTE82RHNVN1JkVVh3akVDelRMVHZHbzNvSEhhWUhJ?=
 =?utf-8?B?WXpodzlSK2RSNTBjVGo4a3pYa1JySEVhUnRHdXBJUjBxNXo4Q1BpcXNQRlhr?=
 =?utf-8?B?SldBemdBRnE3aHNwOHFNZTk3Vk5teXBrRlNkUlpVZ0xVeVBPMTNNeG5yR1Bv?=
 =?utf-8?B?TkJTci9SeTBQQmJwL1R5dytCVE9QVnBxQzR4c1BJd1AzNVBlR3RENGtNVjMr?=
 =?utf-8?B?VEt6OFZUR2ZOam1vSVJPVTFmT0RVNVpqaFRobEUyU2pjcXVMNUdIUTBpcjhm?=
 =?utf-8?B?dTZJV0pmcFRkWm0xRlJHYStiaDNhZm1ZYVFwMkpNOTB4bmdQbDRQK1A5eHRK?=
 =?utf-8?B?aVZjZkdJNVBUMFNxWFQ5R2QxM0NRMUlCYXgzN1Z6YXRpZUNLUlRxQ0ZFRHBC?=
 =?utf-8?B?cHRyRGlRUGRtRDlFcmJadUZxRGl1M2U1UmtNOTZBcVR3cFBtaElHd0RCVGFK?=
 =?utf-8?B?VFdiZFZJKzhOb3ZRa3NMOFRDUDlSdkRhbi9PQXQxVEJRWDB3NXRhUDRLbVcw?=
 =?utf-8?B?eVI1Nkt0QVVqUVZpZlllUTU0a291aGVNQWVBdVhYWVN6Z1BqVHRmOGlqWjRz?=
 =?utf-8?B?ZWozY29EOTF0K1VHbHBwc3BPU1pBRFpPZ0FJL3A3ei9GOG5Nc3BvcWtubytD?=
 =?utf-8?B?ekgxekV4Z0I5UjdCSDBsN1dxWnVocjNlcUdoZFJ1SUNiSWtzQmFBTm84NGdp?=
 =?utf-8?B?SFFrbndGazB0VER2NzZPR2hsY2RDREwvV24zbjZ3b1JJblpZMXhXdDRzOHJj?=
 =?utf-8?B?SGRBcW9pSkl2bzMwRDQ1dHR6L0J0cUJzZHhPMUpOaVpsVVFjZVlUVEp2d3RP?=
 =?utf-8?B?MnNxRXlhVFZUaEhQdzR4dCsrbjBoVGdWQ25qRG9HN1UyaDAwakZQeFFUcUFJ?=
 =?utf-8?B?L2FCaWE3ZUpwVjdCblRjYmVYZjNpaHNxamgyOVZtMkJMemZERWJvL3ZPRnQw?=
 =?utf-8?B?QzYyaWZ6RmhoY3ljMkRxR3NVMTVXdGdTWDJ0UnBOZ3lnTmdRanY3Qm1tSWZ4?=
 =?utf-8?B?QU5jZ0s4Z3dtQ203a0FTRHRJL25WS0JnZFBMSFZDYnFHY3RVYlkvUmg3dTZ2?=
 =?utf-8?B?SHE1WnFOUG1yMWM4eUloMkVjR095TmNzMFp0VFlGRld1RE9NTEc1d2dockJj?=
 =?utf-8?B?bHQyME1HWE9VSExUVFhHU3ZSWUVsUkMzTWVaeGhzQ0dFeGw1Q0ZmUTdLKzZi?=
 =?utf-8?B?RGJHTjlnY1F4U2VtUnR2N01zL1YrdXdWZFdYVGZDWXI2OEpNRFBLWkpZd3pj?=
 =?utf-8?B?MnBBNHVVK1BVYklaT3JqcGJzTUhpU3dyTDdkWVRGakRtUTJGemo2eWZWQTBM?=
 =?utf-8?B?aFpGMW1hMDNMWkRENk5yMmp6YnRBajgyWFgvYldIaFQxWVVuZ2Q4RFdDaGFu?=
 =?utf-8?B?djlpNEZ3bk5nSTBRNTR6RkxUbXlxY3lNcmtTM2ZkUlFEYUxBanZjbVNOdDdv?=
 =?utf-8?B?L2pqNmU5VjdBczFWY2FuTDU1Zmh4MkdvZVJ0aytUUzVDQjBvbkRMeWxSTWJz?=
 =?utf-8?B?QzlyR2RwSElZc04vTXMxNEMrcXp1Ym1BTi9zSGZxeXJsU1habXNsOTdmUnRq?=
 =?utf-8?B?TTdkZXNiK2NjT3FjRkxUK2Y2YVV2T1NtdnRGd0YvYWlPWEZTMERBd0dibVBY?=
 =?utf-8?B?cjFJazRGM0M1M2NRNXJiS1pYOVlFNXJBRStvVGNlVUZNaU0zVE9UR0NhRzdl?=
 =?utf-8?B?aHZuNzBDZlZIUkFFeUZjb3ZnM2VDd3lCdFRSK3JzTkZOeC9wSWZyNVY2NUxo?=
 =?utf-8?B?MmlOYko1VjBDd01IU0FzR1RNeDRkMm83dDMrK1lFUjk3S1pKcnM0cjVWbGtE?=
 =?utf-8?B?ZWl6ck1rR3BKdzVJM1dxaENjbGhyMG1UV21NS2RNNXZQMlp3OHdJZmZDWmZJ?=
 =?utf-8?B?ZUJYZEZTZ2dwdUlLcjFuVGlvOFljZisyZ2NNcXlHVDFQR1RPTEdhWFRDNHhR?=
 =?utf-8?Q?zkjb023Ga+Aa0tgVyJo+ih/e0TFbjLrA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0ZxS1FRTThNTy9FckxDVEdydUtSQUsxdTNTTnhEK3BvbnR5bnN4NFhyYnAz?=
 =?utf-8?B?d3pQMEFJbW04dVJOVmJNYllsKzNIVW83MHNsRGZCcDhrN2dONmgrM0NVc3lK?=
 =?utf-8?B?d1FsT0VBMUdJVXlzQWQ0c0hmazcwMmp5c2VvS0o5SHdqdmFsOUdWZlJNaXRF?=
 =?utf-8?B?UG5LUnQvWEZodzV2Z0dpZWtNNUxmc0cyZ0FKODErN3kwakhLaDN0SzY3K1hY?=
 =?utf-8?B?cm1hQkxYbXFTUkFtRWJObFY2OVRkNmZGMlNwaTdOWS9FUUNCQkR2M3FSVU1E?=
 =?utf-8?B?eDRoQ1ZobHdDOHF6MXJFdGl2M24zK29kdklpQmFDWnpTSkR0Ymx5Nno0eUxW?=
 =?utf-8?B?UnZNdnVUdUJlNUZteXBnM3BlYXczS1JYMmFWRFFvaU1CVGc0bCtDQzNaNm83?=
 =?utf-8?B?UmRBd3duaE9hVGE5MzR2VlBVdWQ0TzVaUkVwNXVkRHZJZk53cVJBVytkWTM5?=
 =?utf-8?B?VlFHcUFhcnpJYUxpTSthdDVCUzZkc0xLK3JTc0xBZHUwVS9JbUhobi9lZHp1?=
 =?utf-8?B?a25vSkhSb2kyamdDOU1raUxhYnhlL1lEa1RRUkNpK0hWRHNIdjYyYzVDc3lu?=
 =?utf-8?B?R2ZnWHdoLzQ5bDdZczJBUkIrbkNXK0grT3hZc3JETTZjZ1JObW9jeFI2ekl0?=
 =?utf-8?B?VEIwWTA5c2p5L0xyTmJ6K0FJS2dRVy9TWFo4UlUvQlpiSitJVXJjZi9NMDZ3?=
 =?utf-8?B?aDdtZEszb3lFZTZHT1FFbU9YL0ZmSUR2NUV5UlB2RHB5VTltQ1MwV2dXVTRm?=
 =?utf-8?B?U3hxYU1pUGc2MkNnQ0IwRTFiUzdjcnhhT25rT1RSSUZNSzNpZ1VhRk1KSExi?=
 =?utf-8?B?TW9tRnB0VWd1VXVFT1FNTCs1NnlSY1J4RWZnVEo5MU9FcEZMb0lHNnRuWm5s?=
 =?utf-8?B?L1p4ZXpYMmxyZ0pDOVlTWlhEZ241U2diTVgzRUJTS3k5NE41ZkVXTE1BYXJs?=
 =?utf-8?B?ejllVlpzNjNXWWZxV3BNekpvTVZrUW5CSzNLR0pkVzFka3FrTHJnTlFOcVJI?=
 =?utf-8?B?UHFZOUlNT0dyTTlxUmJoTVBrL1cxamFmK3lraGJJK3Ntb0lNNS9ORFliN00r?=
 =?utf-8?B?N3loVW40K2dxNHVtN3dVMkNwZTcrVEt0RzhFa1RZSjhKKytaMnB6NmxGcnV0?=
 =?utf-8?B?U1B3TDErWldQbUd3Wk84Ymc4RHMwNHBMMUQxeXNEanREQmNqWFpSMlJXNEIz?=
 =?utf-8?B?MVZaZWVFTUVOUFppakU5aDBEemI5ZUVPS0JEMWZ6ZWQzZVRJcFdqd0RaaUhD?=
 =?utf-8?B?azRiK1JXem95b0o1cmFZM3YyYVRpWjA5SmZvM1h0TUdrbkl5Q05LdXdLbnJ1?=
 =?utf-8?B?cmNCSmI5dStDU3B1b0VpZlhWYVhUdTdOL2ZXajU2R01XeHJicTNKb2dKWVow?=
 =?utf-8?B?QkFpRVluTEZZa3hkdzRhcVNEMFdYWDlwbGhocjBxeFNGb2pIa3AxZzQ4YlRy?=
 =?utf-8?B?U2gva2piQUVmRzh0RlRZYWU0RktpV3BDaFpCRjdJejZpM1QzMGxWc0JISmlx?=
 =?utf-8?B?UkV6RVlsZmo3aFFTMWZnZW5lVWtoKy9pQVVwL3lvUk9SZ2ZtWjR6L1Jxc0cw?=
 =?utf-8?B?M2FmSUJhUW0zWmxzcEhFTHU3OFJHYWZjOEZveXUyODZKK0dHOUFPdVcwd0pk?=
 =?utf-8?B?akhTR2xnejhOZUJid05FRW5TWHRia1F2bkRjcnF0aWxJZVpaK045S2FCdWlk?=
 =?utf-8?B?cmt5Q2p1WEd0MjVDYlN6SEp6TkJtZVlSWlYwSlJ1aFpHT3hFSGExVC9sc3Bs?=
 =?utf-8?B?R0dpRzdORnQvMXhXb2VPZUthckZlY1ZQQ3ZpTm4zendxSEVKZDVFY1dvS0Zk?=
 =?utf-8?B?L2tvZURMKy9PdU9GbDhiZEJzdC8rdnp2MTl2M01QMkFyclQyZURRL3NtaGd6?=
 =?utf-8?B?UTJVNXNNM2syNkJYd2d4RGx3d0hYZzZKRGJaZS9lcWVTcnJVRnNyN1EzRTRp?=
 =?utf-8?B?cnFmT040eG9EUDhEZ0VEcU5LdllXelRBRmpGSEpBRXhUNUh6NHZ6RnlRUlV6?=
 =?utf-8?B?NFJ6RG8vdVY4MVBCVnM5Z3V0T1RGS3RaM0dLWXVXK24xYURjWXhaUEdVQloy?=
 =?utf-8?B?cVY2MTVlU1lpUWdFdjc1TGI0RFQ2MVlGNDhlanBPTTBaYm9oMFpncTBtNUNB?=
 =?utf-8?B?M0VadHBrNVRoMFdZVnhUTWRhQ2pydldJaVlTUTBVWXhtWFdDV1p1akZnOXRv?=
 =?utf-8?Q?/axZzxutH/lRMs1QTcPQD2U15QtUBd3+8vLCvlsa2LMm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d6197a-1510-41c0-f999-08de3c7c99fd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:24:59.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Maq1qDcTaNwUUt2nPwSUwWNfBrsVhp6ok65TZbfyP9A6egm/l5kqh9EsJHhSQaFkcoo86yc2VZxbJ4UY/Wa8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471

Since `ALIGN` is a const parameter, this assertion can be done in const
context using the `assert!` macro.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Result of a quick discussion about build_assert with Alice at LPC. :)
Thanks for pointing this out.
---
 rust/kernel/ptr.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index e3893ed04049..5b6a382637fe 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -5,8 +5,6 @@
 use core::mem::align_of;
 use core::num::NonZero;
 
-use crate::build_assert;
-
 /// Type representing an alignment, which is always a power of two.
 ///
 /// It is used to validate that a given value is a valid alignment, and to perform masking and
@@ -40,10 +38,12 @@ impl Alignment {
     /// ```
     #[inline(always)]
     pub const fn new<const ALIGN: usize>() -> Self {
-        build_assert!(
-            ALIGN.is_power_of_two(),
-            "Provided alignment is not a power of two."
-        );
+        const {
+            assert!(
+                ALIGN.is_power_of_two(),
+                "Provided alignment is not a power of two."
+            );
+        }
 
         // INVARIANT: `align` is a power of two.
         // SAFETY: `align` is a power of two, and thus non-zero.

---
base-commit: 60c7398bded2e11f0db40a409a241b8be5910ee2
change-id: 20251216-ptr_assert-3d9990798dd7

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

