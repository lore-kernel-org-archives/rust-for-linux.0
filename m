Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45382BEC3F;
	Wed, 28 Jan 2026 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567885; cv=fail; b=fh9ZpRjvSZ/fjFKaAgVRn2qNxDazYAzWRhW1vcUpvX9ROhKvO0A5H+tb0O66vIg/qkaaW7VIH7WyhvXo/mzWItW/8TcVpghybFtMieDYJliAY896ixa9iIhVHa9bHEiUzHEeQmlI4KY80UCva4LkNyA8oSWKU81FKUVEn3BveqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567885; c=relaxed/simple;
	bh=FrQI53criELzCbZuURyUUM1YRWCNXu/M3rZjFPNb0fs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LMznV6hBmgk/F4Vi39DglMeUVGrCYL0tQv8pQ6qTBAWwG3vJi1bld0leTAOMQmO1Fkv9i3S0f7+oeY8Oc5yk951eSTcZfpRaqZmnRsRbblmmr8AXNPCzjSa/djFiyTGPJHLVB+yKUvx+fbsUyzwdPo8D+5Qn40y+fGdsglBg2h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XJ3PFtIk; arc=fail smtp.client-ip=52.101.193.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XJ3PFtIk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb76g3QiOqqfBFvhbVPW/toAwHXaav0nz3Icsfq8h2JVAGxH78IOKxwvm7W1DWgkjujO5Zvdj8mbF4DXcFodA8TctOY2EF6ATCwztw+oOKmw/Kf7OrAAWBLhojIMJ3Mrheu6dbQfsoZI/h8hMF4sgiXeaDOOn5rOrjNTf5TQs2dWJSWEsapP3KDwM4VTSggM9Pnc5KkCF1R2hZ/W+m3DN9p+f3RiKR+9iVsiVvhmZY/IYxidLn0qsm4a9EWc7/wLfjqXQT+GObDBt7ULjdPEJjL9HZvOTTUnG1dcTEyJXtzTteSAPJXmBhmi5jgokspt82mMdwurnajIJHKopZ2A0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpEFfxbiT074w9mhRV+CECIBRW+N0L7Zr8XZQDTgQJc=;
 b=KXqtA2AiStZhH8hnPooKSXatzAFLErXvboOkpGpqamVzIjbWY+51dYTiWE7dB1+w14/BiozIofMQ0LM+eKHWTBSr0J8eRiKJQFKl8YQjfGl86wy7jkwkzQYT7ZYf3DohFxdSiRsF2AMPksSA3tVWS7Nyn3l0QPCAM6+5GfJQwCnlQ/Lt1r8lmezAAe5Cnust2eIp07SHQPMYbfGf++UH/Md1M7LUzOZjej5Ct6jdyg0dDzigKRvCeQh9N15TiblCOxEh0OOF97r/Ih5K3qa1xWtl2ZC0x8WpB0Qx7WaMHV6YsJitvkQe/2VEe+7JGO3wncPJZcSUZA36kIRGJ02BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpEFfxbiT074w9mhRV+CECIBRW+N0L7Zr8XZQDTgQJc=;
 b=XJ3PFtIk9AhgA1zd6gPTbRseCd8aBkKc/YLh6loK8U/RAywjD2S/sZmTP93ubw2nyJwJzxj+D8AyTJcrZ1VF8Nt8LYKGYw7LHf5InsyUC/fx+YfxDT5TjoFZ7Lyb7tfTvMDxo3gUyI2jH+554Rp0dbhBhruuAmNr4BeDmZRWlmMu0PIt7kCZ/mAftjfLk0/t0NBAk01tDtnjtIqDnAPdpKF8d/4lHQXzEvDSMZi/dFTjy2MtD2UR4X8r8B1ZbB8URH/0Hi/eXupbfrJCdY49GdEgjVbyuS1ARsHpOabNqT9lHVwh1j8eFXqrVhvnsOpf57H+f128e40doHsTvdVU6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 28 Jan 2026 11:37:31 +0900
Subject: [PATCH v4 5/7] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-register-v4-5-aee3a33d9649@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: ce15c3ec-bb7f-417b-bca1-08de5e163d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXFzeFBSNUxldVlEOGhwVTdmaENFbHhib3VDZjJKSlBFYjVCTDYxUWpoRnBr?=
 =?utf-8?B?aWZKK0NHbVEwY0VuaHgzU091ZUg4a3Y0TXg5WjAzYU5RMCsza3lwdHcwL1cx?=
 =?utf-8?B?dVRhRWRoaU5xS2taL2RaUko3OFJvY0I4QmxzZm44YlhpUUsrN1BLVVQ4cUs1?=
 =?utf-8?B?L3l0c2EycnRrSGVscGxmRFVwYlNjSjZxWlZtdUI4VGlNTnZBYVV2VkgybjNU?=
 =?utf-8?B?T3llOTVzVCtxMThLR2VYZFczT2dzTU1Gdkc5OHJNcHVrRnZhLzRNYXllV0xQ?=
 =?utf-8?B?aFgzZUtIQjFuQkUwTWNJUTNkRVlPYWRXYkFaM3M4OE1jbjd3K2RSM1ZBenl0?=
 =?utf-8?B?MTNqSDY4Mmhrd0hUbnUreGEwdWkrenNBWjFsZTZyZTAwMkhtdFdOVzBZU0s3?=
 =?utf-8?B?cGRwK3hlQ3pwSFFnNWpvaVNOK2JFS3IzT3VTZEV1L0tmWjBwdklVc2FINmEw?=
 =?utf-8?B?T1Nvc21xdVVPTFJtemlrR1ZkZTdMOGp2YkgrUDcxcU5sRDdHMnJRd3FhSXZB?=
 =?utf-8?B?NWtSYnVUdGNERUhJZ2xDOTd5dHhkc3k0RE5DODFCT3FCZ04vS1IvOFFMT1No?=
 =?utf-8?B?a3JrOWtiYUNHRlh6cDM2UGVmcXNNT01Ea1llSzYybFVHNTJ4cjFsOGdBM2Vh?=
 =?utf-8?B?MEZPMTVWU0V0Y1k3Q2pZS1NpRWNnbjJ5Z2hrVm8zM25WZ0k5VWZxYXduRUZK?=
 =?utf-8?B?R0xmSGxiZnZod1o3aTZkU0owSjhuTEZKN2p2dlgyS3RtbTdnNXBvcm5mVGdT?=
 =?utf-8?B?QUIrZ3JsTkxHdTVlUlhrcXU1OUtUM3ludXBwSXNJaGFFaCtXYWhvTysxVFdE?=
 =?utf-8?B?UVBzL21lNnVtdWpRQUtDbUNVT05oVWhUN3lORUlndk5zV0xPY1lQdlg4UVRn?=
 =?utf-8?B?SjBaZWNNa2E2bVhNMlJCcGluRTNBbCsybXJveVRNaHhybWo3R1pqaWc4aXFu?=
 =?utf-8?B?MkZ3ajBSSUQrT1Z6VUc3SWt6a2lHcVNrNU1GT3lOMHJyWW1heDl6TG1CMHdk?=
 =?utf-8?B?VFQ5OXNvODY4L1lyUzZpN0VaRmRTZDJFMStidHpHdWNYZGsvL25TNzhwTUFa?=
 =?utf-8?B?NlJWQ1R2cDcvOG5ESndoeTZpdHA2dWlDUlpvUU0wdzFxNEg3YisxNmorUkhy?=
 =?utf-8?B?bHlNbnYxQmhiZ3o3TnNLdDdybnBUVTJsT2hrYW9oYXRpR2piMUl6bjU3bVda?=
 =?utf-8?B?VEdRcjlZN010VzNJRFB0bGlnMnA5bW02eUtDWm5XUDdqODVPOVJsQW93NFh6?=
 =?utf-8?B?ZFA0VnBMVWI4b1pYVXhhSUpzWi9lU01NWDQ4d2M5bnF4Zm9DU0lYNWZWN24z?=
 =?utf-8?B?MWF4b3VadDNFS0tMZmdsbGp5bWk5Y3VzMGdHYWhaUnB5a2tkMFMwUlU2N2Mw?=
 =?utf-8?B?V0dkSWZrQ0ROSFJ4OCtDUUF0VFlTMjArUk1oTTk2WjZWejQwbmpzbzJOQTdt?=
 =?utf-8?B?QnIxSFVlTlNtZUFOK3BPVFJqK1FVMFhBTXEzL0U4NkNyYUt0WXplWUdJL0xB?=
 =?utf-8?B?YTJGUmR0WXpYUzlmbnBHU1I5c2QzbEtOL0IwRlVLR21VK3dXb0dOYzFFTHdP?=
 =?utf-8?B?dVBRQXV5TGdiclVBRHZDNHc3V0Y1bGp5VnBWc3dWbVp1THROV0ViOUFuQjBx?=
 =?utf-8?B?WjM0MU81SlJDYTc1U3Q1dWk0ZDNQb0RBbnJMT2IvUTFoYVd1bUZmK1IwbVdV?=
 =?utf-8?B?QWRXc2RIK1BaWmRLV0xhMU9NUFhuTVlnb1ROaGRaVGhGbW9idHZ1MUpvZ2Ni?=
 =?utf-8?B?MGtEZFdGSms0eVpneGFFYWZzNlN1NytudnpGbnVBaG1kWUpEVkZFZG4rYXhr?=
 =?utf-8?B?b1p1dHJGN3JFaGlkK0swUEdncjVUZEdqMTRkSVBzZjJCVU5EMGVKTS9scHp2?=
 =?utf-8?B?eUxnckJ3TzB2dUF2Z2c4UUwwUmxoK3FEL0VOV0F2WFMvU21CbEh3RDBWNlhR?=
 =?utf-8?B?dHYwSCtvWkVwUkV1a0c1NnRneVdPb1FXUkN6aW5rMk01enBPbHpoUzEwYmgy?=
 =?utf-8?B?S1Z5T0hBUkdyaHROVnN0WENqblBMWUpvWUdabkY1SjlKc01NNDB0enYyaTA2?=
 =?utf-8?B?SjhjbnUvakpJMDJIMVpSMG1zTmdWM1k4UXFjL0NGOUFabUNUc1luT2NqYVJo?=
 =?utf-8?B?Rlh3aDEzNXJuUTA2Wm1ibU9GUS9rQVRncFBFY09JdW15dThIUWZ3b0dyMUY4?=
 =?utf-8?B?aUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2dLTTMyL1Z0RVRQaDV4Y0JFU2V2TjVYSmpuajM5VjI3bE1SRkVZSXpibU5H?=
 =?utf-8?B?c0owb2JHWFhPbmR6RHUvK3JkUGxQM0h3K1l5c3hOV1J3a2Nzb3VOWlRtMXNm?=
 =?utf-8?B?WWF4Nlh1dHNyOXl1aTdMY0Z2Qk53aGRraHlheTBqRVhHOFpKQkpueUI1OVpF?=
 =?utf-8?B?bjhSenNOZCsyL09WYTBndFdEVzhhKys2L0FrMEVZOUVxb2luWDJocmxCUzcy?=
 =?utf-8?B?Z1NoTFpGaTJQOXNWRzVuR0lOT3MxMXovaG1maWNyYVdpdUJzRXo3NTh2R3hR?=
 =?utf-8?B?OS9uQXNoYWZ1cXp1YmxtNDRUSCtuZUl2OXVNend6N2d2MGxBVFF4M05zOS9Z?=
 =?utf-8?B?RDlzQmN4ZDZBaTUvRlBBZmgzTzFqQTZhR29vdFNHUDVRU3l0cytXNmNJSSs3?=
 =?utf-8?B?VWpwd09ycWs3M2h1a01aa2tWeXZpa0E0eGRNOHYrUUNCOU4yaFRHcnN4OVlp?=
 =?utf-8?B?ZEdpQ2ZZYlY4SFVZZU9OY2hPZ2p5R05TaFdNUnFiOEJBcnZlY0YvYTdpc3I0?=
 =?utf-8?B?RWVFU3h2MGlBSC9YN2hqWVpzc0tNYzRqNENUamczVGw0bHc0MVJGNmtKdnVi?=
 =?utf-8?B?VHhRTGw0WDJ3MEliUEx2SzZla2krVEdsVjRPMi9TMTcvWW5GVFZIaFIvWCtV?=
 =?utf-8?B?S0dQbzllVUhmQ0FNckp4WCtuMGVYYzcyeFhvVDM0bk8rbkQ4WUxPV1hBazVq?=
 =?utf-8?B?VUk3RG1GcGtaaWp4aFFwZUlPUE5adnkzSElzS2FjNWhueW1SbzBjUzRwZm9y?=
 =?utf-8?B?dHQzekpnRndPQUxoZEk1bnhrOUNhRVpodEQyejc5WDM1K1F4UVk1ek5QeXFV?=
 =?utf-8?B?ZWZ1Rmp6d1EyVjByRzZRYlNyc1l2MzhsMW5OcmZ1NE1XdlRWaVFzdjFwSldR?=
 =?utf-8?B?MlBOcS9kTTE4ZElnbTlZaTdwc3U5TDI1aTlZZWgyckdPMkdsNWg3ZVg4dlZM?=
 =?utf-8?B?QitJS0JTMmV0S0M2b20vNk9zekEyRnBkTExWQ2Rrd0o0RVdONEcxLzRTUnRU?=
 =?utf-8?B?cU1VUU1OaXcxMFA0ZkhhenR2L1p0RUJSN0hvRUgvUWtYK2I1Z2xhazFIV2dv?=
 =?utf-8?B?U0ZzL1U5dHpNdHIwSVlSUWptY05yUGZOQWZWV0NpVXhoNEkxUnpLSDVIYW04?=
 =?utf-8?B?RUp4QU5yUy9BNHNyeUlwYzVrNEM2cXdETVAvVWJvRE5vdkdZQzZFWS95QU5P?=
 =?utf-8?B?K1hKaGxBazNzS3BMejIyRmwyVWNiSWpOMWVvQ0h5Y2lEOWlPdGEzTzQ5eE5x?=
 =?utf-8?B?SHg4V1htYUVFYmM4c1ZBZzQyeW4rTC9LSkJPU0U1ZG5HMTJVN2hwam5mNmVm?=
 =?utf-8?B?UmR3UGl6bldma01zbG5aQk9ISldjcEljdEtMK1VaQUw5bU5aeFpwZzUyTTh3?=
 =?utf-8?B?MUl6Zy9IU3NtcW9yQ3lJMFhEdGVCLy9TaDJtbW9yL3BZWmdsYWxUVE1pejlR?=
 =?utf-8?B?eExuaUxmRXpiNHgvTVhoc3BxSTBUNWwySHZzZXRQZWVZZFE3cXQzc3NNYlBp?=
 =?utf-8?B?UUFCRUtNUC9ldlVUUkFQcGxWZWhoMDRNeVpRdzI5bXJ0K01zSXlYME9xM0ti?=
 =?utf-8?B?NmVqaTBuVFUrQkxnbDdUc3p3b25Rd3VNWE9QaElmZDlYcm1MVEtSTG5JZlhz?=
 =?utf-8?B?RWhoQ1pYakJ1L2JrZ1A0T1RUQTBCSk0xazhPUnk3b2JuV0NWSDNBeEVCYTNL?=
 =?utf-8?B?bEV6UTJyYzJINGtiZWVxSStvbEd2NmRqZTJadXUya2RMOFM3SXVMZW40OWU0?=
 =?utf-8?B?ZkZIZU9BZnZLQ09nMlRZb1k5bmpyVThHaTVMN0xUbDUyN04xWHRGZFlZZkhZ?=
 =?utf-8?B?VzdvTm9sSlZvUGJ1ZWVsbnlqUGZEYlExTjhEcXcwWlJNZzlhWkFDSm1NTmJm?=
 =?utf-8?B?Y1dJb2c0SmZiSDBudHFUVUdzMWVQTkNmaDZvWHBKaThvZmRTZG1YQnVWR2xZ?=
 =?utf-8?B?a1FGUThvUlM4RnJyWjRGbHhYQUJDQUR3U3pHYU80NTd4cnp0alhqbjhhMFda?=
 =?utf-8?B?bi8yQW9VN3lQYWVDclNvdGVqaUYxeWsxc1FuMkEwVUh2S3k4ZHp6b0xkVGlR?=
 =?utf-8?B?K3FvYkxVbjRZb1Eyd25rNlZ6ME9qQVc4aDFoZnJ1SWN2NnA2OG1UaU1DcTE5?=
 =?utf-8?B?eWxFTm1FbGxNTjJOM0U2a1RUeGJoaDE3dU1MUWh2anZZQTJOYjd2R01LbWpU?=
 =?utf-8?B?V1BPcUoxaGdCaXNZKzh2bHgveXhrdWFJUzBWTFZYa0VHWkdPWTRhcGRsdG5w?=
 =?utf-8?B?RGdrRWc5SC9ZY1J0a3JJMXkrbkh1UkVhUW4wNFZaRnlxMGpFTGU5M2kyYnNo?=
 =?utf-8?B?cDRUelVOSnNHUld4UHhiSENWKytSQnBBM1l0d1puaDc5ZHZlWDFUQzYzTk5z?=
 =?utf-8?Q?JlNlbUJFxi0cjnv2/0QPQ6a10/5cxg8EJ+iTAk/t0MO2h?=
X-MS-Exchange-AntiSpam-MessageData-1: tKl1U7wKwUPCTg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce15c3ec-bb7f-417b-bca1-08de5e163d52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:54.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wK9UH5ZcmS5unlljSBdL65M9OdrdS+mDFqna3gKmRItOQotybdhicfYf632TLxFKRqGvZ5tjmXbJmkayen5BHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

Add a macro for defining hardware register types with I/O accessors.

Each register field is represented as a `Bounded` of the appropriate bit
width, ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |    1 +
 rust/kernel/io/register.rs | 1287 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1288 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 056a3ec71647..112f43ecbf88 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -11,6 +11,7 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
new file mode 100644
index 000000000000..fc85dcd1f09a
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,1287 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The [`register!`] macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid.
+//!
+//! [`register!`]: kernel::register!
+
+use core::ops::Deref;
+
+use crate::io::{
+    IoCapable,
+    IoKnownSize, //
+};
+
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub trait RegisterBase<T> {
+    /// Base address to which register offsets are added.
+    const BASE: usize;
+}
+
+/// Trait providing I/O read/write operations for register storage types.
+///
+/// This trait is implemented for all integer types on which I/O can be performed, allowing the
+/// `register!` macro to generate appropriate I/O accessor methods based on the register's storage
+/// type.
+pub trait RegisterIo: Sized {
+    /// Read a value from the given offset in the I/O region.
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>;
+
+    /// Write a value to the given offset in the I/O region.
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>;
+}
+
+impl RegisterIo for u8 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read8(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write8(self, offset)
+    }
+}
+
+impl RegisterIo for u16 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read16(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write16(self, offset)
+    }
+}
+
+impl RegisterIo for u32 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read32(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write32(self, offset)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl RegisterIo for u64 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read64(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write64(self, offset)
+    }
+}
+
+/// Defines a dedicated type for a register, including getter and setter methods for its fields and
+/// methods to read and write it from an [`Io`] region.
+///
+/// Example:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Basic information about the chip.
+///     pub BOOT_0(u32) @ 0x00000100 {
+///         /// Vendor ID.
+///         15:8 vendor_id;
+///         /// Major revision of the chip.
+///         7:4 major_revision;
+///         /// Minor revision of the chip.
+///         3:0 minor_revision;
+///     }
+/// }
+/// ```
+///
+/// This defines a `BOOT_0` type which can be read from or written to offset `0x100` of an `Io`
+/// region. For instance, `minor_revision` consists of the 4 least significant bits of the
+/// register.
+///
+/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can be read by calling their
+/// getter method, which is named after them. They also have setter methods prefixed with `set_`
+/// for runtime values and `with_` for constant values. All setters return the updated register
+/// value.
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::num::Bounded;
+///
+/// # register! {
+/// #     pub BOOT_0(u32) @ 0x00000100 {
+/// #         15:8 vendor_id;
+/// #         7:4 major_revision;
+/// #         3:0 minor_revision;
+/// #     }
+/// # }
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T) {
+/// # fn obtain_vendor_id() -> u8 { 0xff }
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = BOOT_0::read(&bar);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+///
+/// // Update some fields and write the new value back.
+/// boot0
+///     // Constant values.
+///     .with_major_revision::<3>()
+///     .with_minor_revision::<10>()
+///     // Run-time value.
+///     .set_vendor_id(obtain_vendor_id())
+///     .write(&bar);
+///
+/// // Or, just read and update the register in a single step.
+/// BOOT_0::update(&bar, |r| r
+///     .with_major_revision::<3>()
+///     .with_minor_revision::<10>()
+///     .set_vendor_id(obtain_vendor_id())
+/// );
+///
+/// // Constant values can also be built using the const setters.
+/// const V: BOOT_0 = BOOT_0::zeroed()
+///     .with_major_revision::<3>()
+///     .with_minor_revision::<10>();
+/// # }
+/// ```
+///
+/// Fields can also be transparently converted from/to an arbitrary type by using the bitfield `=>`
+/// and `?=>` syntaxes.
+///
+/// If present, doccomments above register or fields definitions are added to the relevant item
+/// they document (the register type itself, or the field's setter and getter methods).
+///
+/// Note that multiple registers can be defined in a single `register!` invocation. This can be
+/// useful to group related registers together.
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     pub BOOT_0(u8) @ 0x00000100 {
+///         7:4 major_revision;
+///         3:0 minor_revision;
+///     }
+///
+///     pub BOOT_1(u8) @ 0x00000101 {
+///         7:5 num_threads;
+///         4:0 num_cores;
+///     }
+/// };
+/// ```
+///
+/// It is possible to create an alias of an existing register with new field definitions by using
+/// the `=> ALIAS` syntax. This is useful for cases where a register's interpretation depends on
+/// the context:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Scratch register.
+///     pub SCRATCH(u32) @ 0x00000200 {
+///         /// Raw value.
+///         31:0 value;
+///     }
+///
+///     /// Boot status of the firmware.
+///     pub SCRATCH_BOOT_STATUS(u32) => SCRATCH {
+///         /// Whether the firmware has completed booting.
+///         0:0 completed;
+///     }
+/// }
+/// ```
+///
+/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
+/// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For
+/// instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition
+///
+/// This can be done using the `Base + Offset` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
+/// into code:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// // Type used to identify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T) {
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register! {
+///     /// CPU core control.
+///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
+///         /// Start the CPU core.
+///         0:0 start;
+///     }
+/// }
+///
+/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
+/// // that is used to resolve its final address by adding its `BASE` to the offset of the
+/// // register.
+///
+/// // Start `CPU0`.
+/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
+///
+/// // Start `CPU1`.
+/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
+///
+/// // Aliases can also be defined for relative register.
+/// register! {
+///     /// Alias to CPU core control.
+///     pub CPU_CTL_ALIAS(u32) => CpuCtlBase + CPU_CTL {
+///         /// Start the aliased CPU core.
+///         1:1 alias_start;
+///     }
+/// }
+///
+/// // Start the aliased `CPU0`.
+/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
+/// # }
+/// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive registers that can be interpreted in the same way. These
+/// areas can be defined as an array of identical registers, allowing them to be accessed by index
+/// with compile-time or runtime bound checking. Simply specify their size inside `[` and `]`
+/// brackets, and add an `idx` parameter to their `read`, `write` and `update` methods:
+///
+/// ```no_run
+/// use kernel::register;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register! {
+///     /// Scratch registers.
+///     pub SCRATCH(u32)[64] @ 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = SCRATCH::read(&bar, 0).value();
+/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// let scratch_15 = SCRATCH::read(&bar, 15).value();
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = SCRATCH::read(&bar, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = SCRATCH::try_read(&bar, scratch_idx)?.value();
+///
+/// // Alias to a particular register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Firmware exit status code.
+///     pub FIRMWARE_STATUS(u32) => SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+/// let status = FIRMWARE_STATUS::read(&bar).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ 0x000000c0 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ 0x000000c4 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as a contiguous array.
+/// register! {
+///     /// Per-CPU scratch registers.
+///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// let cpu0_scratch_0 = CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
+/// let cpu1_scratch_15 = CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = CPU_SCRATCH::read(&bar, &Cpu0, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime value returns an error if it is out-of-bounds.
+/// let cpu0_some_scratch = CPU_SCRATCH::try_read(&bar, &Cpu0, scratch_idx)?.value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Per-CPU firmware exit status code.
+///     pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase + CPU_SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+/// let cpu0_status = CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ CpuCtlBase + 0x00000d00 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ CpuCtlBase + 0x00000d04 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+/// [`Io`]: kernel::io::Io
+#[macro_export]
+macro_rules! register {
+    // Entry point for the macro, allowing multiple registers to be defined in one call.
+    // It matches all possible register declaration patterns to dispatch them to corresponding
+    // `@reg` rule that defines a single register.
+    (
+        $(
+            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+                $([ $size:expr $(; $stride:expr)? ])? $(@ $offset:literal)?
+                $(@ $base:ident + $base_offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            { $($fields:tt)* }
+        )*
+    ) => {
+        $(
+        ::kernel::register!(
+            @reg $(#[$attr])* $vis $name ($storage) $([$size $(; $stride)?])?
+                $(@ $offset)?
+                $(@ $base + $base_offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            { $($fields)* }
+        );
+        )*
+    };
+
+    // All the rules below are private helpers.
+
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $offset);
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET);
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base + $offset );
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ident + $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base + $alias::OFFSET );
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr ; $stride:expr ] @ $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_array $name($storage) [ $size ; $stride ] @ $offset);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ] @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::size_of::<$storage>() ]
+                @ $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET + $idx * $alias::STRIDE);
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ; $stride:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative_array $name($storage) [ $size ; $stride ] @ $base + $offset
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::size_of::<$storage>() ]
+                @ $base + $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative $name($storage) @ $base + $alias::OFFSET + $idx * $alias::STRIDE
+        );
+    };
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use SCREAMING_CASE.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(@bitfield_core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
+        );
+        ::kernel::register!(@bitfield_fields $vis $name $storage { $($fields)* });
+    };
+
+    // Generates the IO accessors for a fixed offset register.
+    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) => {
+        #[allow(dead_code)]
+        impl $name {
+            /// Absolute offset of the register.
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from its address in `io`.
+            #[inline(always)]
+            pub fn read<T, I>(io: &T) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, Self::OFFSET))
+            }
+
+            /// Write the value contained in `self` to the register address in `io`.
+            #[inline(always)]
+            pub fn write<T, I>(self, io: &T) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, Self::OFFSET)
+            }
+
+            /// Read the register from its address in `io` and run `f` on its value to obtain a new
+            /// value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<T, I, F>(
+                io: &T,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io));
+                reg.write(io);
+            }
+        }
+    };
+
+    // Generates the IO accessors for a relative offset register.
+    (@io_relative $name:ident ($storage:ty) @ $base:ident + $offset:expr ) => {
+        #[allow(dead_code)]
+        impl $name {
+            /// Relative offset of the register.
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it.
+            #[inline(always)]
+            pub fn read<T, I, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE + Self::OFFSET;
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub fn write<T, I, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE + Self::OFFSET;
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it, then run `f` on its value to obtain a new value to
+            /// write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<T, I, B, F>(
+                io: &T,
+                base: &B,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base));
+                reg.write(io, base);
+            }
+        }
+    };
+
+    // Generates the IO accessors for an array of registers.
+    (@io_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ] @ $offset:literal) => {
+        #[allow(dead_code)]
+        impl $name {
+            /// Absolute offset of the register array.
+            pub const OFFSET: usize = $offset;
+            /// Number of elements in the array of registers.
+            pub const SIZE: usize = $size;
+            /// Number of bytes separating each element of the array of registers.
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from its address in `io`.
+            #[inline(always)]
+            pub fn read<T, I>(
+                io: &T,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            #[inline(always)]
+            pub fn write<T, I>(
+                self,
+                io: &T,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<T, I, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, idx));
+                reg.write(io, idx);
+            }
+
+            /// Read the array register at index `idx` from its address in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_read<T, I>(
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_write<T, I>(
+                self,
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn try_update<T, I, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::update(io, idx, f))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+        }
+    };
+
+    // Generates the IO accessors for an array of relative registers.
+    (
+        @io_relative_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ]
+            @ $base:ident + $offset:literal
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            /// Relative offset of the register array.
+            pub const OFFSET: usize = $offset;
+            /// Number of elements in the array of registers.
+            pub const SIZE: usize = $size;
+            /// Number of bytes separating each element of the array of registers.
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub fn read<T, I, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            #[inline(always)]
+            pub fn write<T, I, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<T, I, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base, idx));
+                reg.write(io, base, idx);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_read<T, I, B>(
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, base, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_write<T, I, B>(
+                self,
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, base, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn try_update<T, I, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::update(io, base, idx, f))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+        }
+    };
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name($storage);
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Creates a bitfield from a raw value.
+            $vis const fn from_raw(value: $storage) -> Self {
+                Self(value)
+            }
+
+            /// Creates a zeroed bitfield value.
+            ///
+            /// This is a const alternative to the `Zeroable::zeroed()` trait method.
+            $vis const fn zeroed() -> Self {
+                Self(0)
+            }
+
+            /// Returns the raw value of this bitfield.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            $vis const fn as_raw(self) -> $storage {
+                self.0
+            }
+        }
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
+
+        impl ::core::convert::From<$name> for $storage {
+            fn from(val: $name) -> $storage {
+                val.as_raw()
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            fn from(val: $storage) -> $name {
+                Self::from_raw(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` implementation.
+    (@bitfield_fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        ::kernel::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        ::kernel::register!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        ::kernel::register!(@debug $name { $($field;)* });
+    };
+
+    // Private field accessors working with the correct `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.0 << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        const fn [<__set_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+
+            let value = value.into_inner() << SHIFT;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the compile-time constant `VALUE`."]
+        #[inline(always)]
+        $vis const fn [<with_ $field>]<const VALUE: $storage>(self) -> Self {
+            self.[<__set_ $field>](
+                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
+            )
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
+        #[inline(always)]
+        $vis fn [<try_set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__set_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+}

-- 
2.52.0

