Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A939C62B;
	Tue, 24 Feb 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942965; cv=fail; b=ozKRB69x0mg8kRHpfFXryXnB3Js3QmwclmCMgqodE1wb8f+Lh/MvFtE0dR/jZcT2VBNZfNSrJjtSsG3M/Df2f10N4UrpLOe8QZxusiUaLaH3ecG2RNm3W5Bnol6CbIRxWY2wkB2Bt6pMFIUPN5BnzZz1zEFbxOA6vzAsGvKn1E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942965; c=relaxed/simple;
	bh=CSm+/IVDVPZLjsUhm6x6SiUwcFe+6FzQL/zgb9tK9SA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K02QM3aBzGPZoDMxOn0jMsQvZHbo3xqg5wMOypzAC/tY6esRbh8vQGs0gkJMdLCurol7M/mkdq0rAEwyK13l6dL7spOSi1WAAFR4OYp4i8SAi9ofIBzfe/QL+uB3BG+fGB4r7b8bDd+8blVBczO0mruo/ttUBtDJIcfR/9p3lS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BoYciG7W; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BoYciG7W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxOriR3pqnLJicJt/UZqasHj9tTkyyMbDviKqL7e6jJ8tZHhDxd7HEauhfdqbNkhlJKKY2gtR5p/KK0ERiOPmfWJByqmWddgyuHKz420Hef3e3CHI+1y6qUBXcQnpFRSg9uac2YPhFmZHXXwbCr1uN+IylqLFYXb8C7uLeAfd+d1YWnkNVevLluChNcH3Qk6neXrOOjnBQGo1OkT9r3HQhWimBJeXEtIckaMxHr0ZzZvoYovrQIaCHBJXzvMUBa/K+ZQwQ3d6luv4H5q7CQb8KYt71CYUaiXcrJxld529fUbgdqJLP20d33W2wAu97i92OQ+FBhssEhzo8pvmmiiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReqsngoF46d6nRQcJt0bwvpLcRSl5OF2INSU9yhApf8=;
 b=kCRgjGgIM4aKxLXEO9ONWoRlXs/ivZ8sVa88aARZqbjwROop/X6NyJz7U+VWMX/ggWfY/Uhcf7oHpaNWckhO4nVocG/G1GSZOQjaOEbMC1upNtVwqWWdx9UL7hHOSmrbEK6WiTT9YAqOfa2C0BCpjbe/RyarZYEhRUTPAfw5wZboo5tuMjTJsAWJVLvbTMCsCg8136MAt3nyrFf56MhUftjQ2bzvWnJryDkjlW7pfFxc8WWjxUc1CcQL44MUJbCK+ul4iDI5jjwUaoagAMbMiWigNhq+e81WbdxSbaDACkm6vH0rC2UZY4+L7NmNyX0jG0I5Rz/eAUyzeaNtva/khQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReqsngoF46d6nRQcJt0bwvpLcRSl5OF2INSU9yhApf8=;
 b=BoYciG7WqIzn053RI9P1n/PGJuk+UDqXfQ29cvPOWftuPfzuVTq+Z4+7XZYHXHiURvItpJGWD/c0YFTuZiOhtQPRmofvEq3q6veIGlrnWOrQaZ0L1PKOr2a8hwv0cA2mSQXRefySJ8SZqNXl+NfxV8S42+HF/18wNRDET0xiOS6a0MQ8TcBXaesg7wxIf+xzs+mtr1+uvOOqnPEFnRasAOtaGGynoAup7W4UiqBL1b1SWejSUjOOhFieU0s4dJ1vXxhLzjqV/lrUkKM1bY2K2/W1MKdCzDkDR2o3mEtN9uQeOG0vQ5NNFv/RtqfPFsxFt9m2ffFPq/iPhX2bjeGXOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:46 +0900
Subject: [PATCH v7 08/10] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-8-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3a0e91-becc-4f1a-d566-08de73b0294c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZklxOEppbUVyaXdGSEhjcEZEbllMU0hQZUtCRkoybmJCR0Jsa3RyNHRqVENi?=
 =?utf-8?B?VUhNTmlYUDJXQWE5OEZUNXYyVm9ZQnpmTURyazYyOUt5VHRCbVYrSDBPSEo2?=
 =?utf-8?B?RFNGQUd0U0paOGNoNjN1R1RvTURRY1ZjcEh4NjF1S0FvczNIQ0hFckFydGlr?=
 =?utf-8?B?SnRjakRFOWJ0eWJ6QlRjQUJNdzZYVEJmNyt6MEhpVkR6SFFTa3RPVGh1U1lX?=
 =?utf-8?B?S1NCblBnOVpyUGY3c0Z2UmhvK0ZFanlyR21YVE11VVVleEE1ZnZHeW5wTUM4?=
 =?utf-8?B?ODFIdG1aa2Iwbk9qS1p0QjcrUEJNMEpFaGxRVjhmbDFtVUJUVGgrK2RFTjk0?=
 =?utf-8?B?QzZWbG5qbGdsRlhrdXpVTDBOZDJyZGxlaFNCNlR1K1FXTS92LzhGdTRYb1hw?=
 =?utf-8?B?K04zOGN3TFNYZGdLVnNqeDRzVmRmUVJFU2tMTWFMRDd0Z3ZURUdLbW9wQTNI?=
 =?utf-8?B?bStGWU13QXo1N09MQmRnQjQydTgrYWhsRWV4YzBnRGNLWmxUTjhROHVMc01v?=
 =?utf-8?B?Ky9Ga0J5NkYya3BvU1N0Z3dkUHBDZllRb0hEWkNmM3N4b3FCc2dVZU9DK0h5?=
 =?utf-8?B?dTFGZlZ5amR2UFhwVzBjcUZ6TDAwa3pJRURGS1BCbXh1bTFhTWpKbnYxb1p5?=
 =?utf-8?B?VnVybUZmVEE1RDhDclV6SlplYWEyd3NIS2xFL2cyUzJlcm96UVlZMXordDM3?=
 =?utf-8?B?MHFwTEFFdFVSdTl5QWFlMkNmeXpPVDA0TlkvZTRCa2hzN3FGdEl3MTBiWW43?=
 =?utf-8?B?YUhQaXlNVHhUTzFiemlGTzZBNXFYRk9nUFJ1cTAzTm1rRm5kdHV0TFEram5u?=
 =?utf-8?B?TTRoNWV6dzJ0STdGTVdEbWI3d2Mzc3ljWkFTcjg4MjRaenh5bk1LNUU1TG5a?=
 =?utf-8?B?bElKbGJqUHpkcUFVamw3M2N5VUZqWE50U1pyZ2RNcHZRY3JwQk05QzNqTlpM?=
 =?utf-8?B?RkUzdG9UZjR1S0QzN1BvVEFoaDhONktFYmNQSFUyaXZ0d2hKQzYvNC8vN0lu?=
 =?utf-8?B?d0hEclVnUjMwZExxUndtc01idXJDL01ESytld3h3KzlQM2ZaMUFtOTY5VWdD?=
 =?utf-8?B?N3g3UVdaOGlSSzc0NndlYXE0WVhCa2wyTGFOUEdURzZDT2UrSXliZ2kxNi8v?=
 =?utf-8?B?Ukh1ZEZUaStPZHc1Y3M1Nk5iOEdERTVJaStRZkhXRk5NQnlQOW0rSkxTY2Ja?=
 =?utf-8?B?NE5jaGY0TVRZWHdoaGZSalc3NkYxTlF0ZGc5TzlVWUQvVFRrZ3psdHpIQXh1?=
 =?utf-8?B?MlpsR0F2L0tqak40bVRkYTV1NE05YTVreEVCazA0ZmlMQmRDV21nZGFrdm8z?=
 =?utf-8?B?TkdnVzEzMXJnNFlKZmw4Y0V1ZXd3REpIODdBVjIwRENhT0d2UFhSMFVIZ2pC?=
 =?utf-8?B?YkFqeDQvWnR5SzNDcnAvTUtNSXVCVFFkTkw0SEZqZGd3S3RwMFhHZkdBYWx1?=
 =?utf-8?B?VmNrWWlUbEFKa3RJbDRCRnZOL3ZKNDVRSEhSRW1XejdxTXYvOGUwdTEvWWFF?=
 =?utf-8?B?ZFhzQ2pTUHlOUE5XWE5ESFdmWVZrSnZjWmNXK1dEOVlIN2dtcFJlak5VTW5m?=
 =?utf-8?B?QnFNYzVxWjE3SGtxTXdvaVRiWWxMZW93ek1tZWVscE0wUjNsU1VzSVNzOGZy?=
 =?utf-8?B?L2MwYWJyMlpsdlA5K3k5OC9BVmUyNTlpSFNhcGFyWTVCRG9IRXZVNXIvYTZD?=
 =?utf-8?B?aWNscmhLRVZTcXZvQmRJS1o5VUxrWkoyTm9oRUdnclpsWmlCK09weWNxKytX?=
 =?utf-8?B?dUQyR2o4VWpxN0pTVGdTVUMvR3YzZlJKSVFtRGRJUnMwOUdRQ2JVSDFOaDRl?=
 =?utf-8?B?V2RlSHpvMkMvUGdRaGdadEpkV2ZreTQxajJ4V0czR3VKbDh0Q0NCNXJNWVFy?=
 =?utf-8?B?NTlLd2hqa2Q3NDAvcGNyUjBzeFh1YTJtSm1ZV3U3OHVTK3JERkxHMUxHQUtC?=
 =?utf-8?B?bXZ5bFV1LzBWa1hkRXBqUVdubm5ndUxWNTlpVTZuQm5PV1FNZ25VTFc1bUh0?=
 =?utf-8?B?R0R0Q1I4NnV6SE1ScEEzRXdURFd4SFFMN25XbjZQWm5IT1NoWmRucXNnNTBi?=
 =?utf-8?B?dnJuTEpodWFmQ0xQVDBlUVhUOXVhSlUvM2VmVTlaaEpFb2V3UWV3eTk3cmRF?=
 =?utf-8?B?UStjM0VzV1BRTEFQbWRHL0txZ1ZnNlhhcVBZZzJVYlhRdnNXYkFFMy9RaFho?=
 =?utf-8?B?b0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akZHTmZMSTZ1d1BmMEVmN0pmU2praDJpT3dCWndKc0lJeE1IV2U3Q2NWZnBt?=
 =?utf-8?B?cDZIUGhxQXhzTktGeEVWQXVMZ0plbzI3UDBHNGwwUzcyWlN4UVZ6STlSTTJ4?=
 =?utf-8?B?cnhCWkZaSmJSTDdRWEZvYkR2YmdsYzBONkl3dGpteUM0VjlRSE1LRDIxM0FM?=
 =?utf-8?B?UVBjZEIyZGlhaXJzSVB5cTZNYzRmNms3NEgvUFR6WmhVNmxjQzNhcUZwSmpH?=
 =?utf-8?B?b3lvdXhRWnNQZnpqNURmNDR0ai9QdjZVbTkrOHorUWdjNzNoUHlES2Zkd2Ew?=
 =?utf-8?B?cmIzcWUwYkYwMmkvOHk2RmhLZURTSEtGU1JzOUVxSGJrN0hLekgrcXVOeHFE?=
 =?utf-8?B?V3M1aFFmRWEzMWY1RnRyOUtEeEplUm9UNjcvdi9PTVU1VG1DWlhxblk4OFpk?=
 =?utf-8?B?MXByRTMwQU1jdVhmb05WRTB6MFhBWkF6Q0VSZmFuaEE4T2NkRFFoOUVNYktL?=
 =?utf-8?B?eGlPVWp6dXIyZm5yOFdqQmZMcWNyNERXcE5GU3FWd0JQYlpDRmxUVUszdUpn?=
 =?utf-8?B?czVIaGlsNi9MazZWTThndDB0WlBneFhVVXVZbEVSZjBCTGozTUZnb280T1I0?=
 =?utf-8?B?U1RKREVRcnJVNjRvY0doRml4S2JqejdHcUJBZEdxYUN2bVBYQmlYcDY4dUd4?=
 =?utf-8?B?VzdOcVpMTW9WRUhZNHl5MWNEdzJLU3pYeHBNSUhxa1NFNEVMcFUvWThFWUJS?=
 =?utf-8?B?YUVVMFRpU1QxNU9kcjRQaEhTNHhYMjFEM3Q5NGJIMFBFVEI3V1drR2RHc1p3?=
 =?utf-8?B?VURtVmNIeDA5aml5UVNwQkFkdUpMaTRua01oMGJWcHZNRzY1OXh6TUZDOWV1?=
 =?utf-8?B?ajJQeXJlM0RwVlJGcWR5QUMvYUxySlUxZW0yN2ZldmZxc0NrNkNXa2VLR1ZS?=
 =?utf-8?B?bHFsWGNjdXFxcWtVaXVmV1Jvb1AwOWJJZzZjclZDOVAxS0Q0R2V4WktIYVdq?=
 =?utf-8?B?ZWpvc2RrSFJTVGVxNUdHcUlKSTRGYW1KVGF1Z25waEVMelpDcVlVY0FRR1pK?=
 =?utf-8?B?RTU4TEJiUWxwWEwzMFh3MlJwMnNvLzJLWnNWQXlQdnpHNE1GUTVxQ1dvVG1E?=
 =?utf-8?B?THNnRzdGcSt6UElhVm5VMWw2SWY5anVEcENQTnBkYjVkS1JzQUIwZUR2cmR1?=
 =?utf-8?B?eDVpMkp2ckpKY29ncWNXR0dEbkozeGpUN25JK0pnRi9IS0lqQklKRFpEd01h?=
 =?utf-8?B?aERjWlBlTXNXVy8xSGx6aVlibzZPemMvZXBZYUV0bUlBMi85MFkrLzNpdG5m?=
 =?utf-8?B?UTQ4QmhxdjhzQmY0WGNMOStKM3NSKzhKeml4cWlHREFPYURNRWhGNVR2RmUz?=
 =?utf-8?B?aFhZcmRMa2hWbWFGR0g4SmF2RnIrUitpaWZhdGJBRDRMRG9mS1FuRURhTkdN?=
 =?utf-8?B?eUd5VjYyZmdWek1qTC9tVmlId3o1c2ZPYndVQWphaFFkcndUN0xCcXF1RHIw?=
 =?utf-8?B?YVBKcUdSdmdsZGx0YW04R1J1WDZ4eEJ1VnVCR2xNL3IrSU1Fb08vZXVpc1RX?=
 =?utf-8?B?UFJKNGZGOE9lRmhUN084ZThZaFZJMDI4dUlrWjhRaDZDby93ZHVLSmltVXJ5?=
 =?utf-8?B?S1BadENiR1NQYW1LUEV4a3NQTUVRRmxLTGlpNkFZcExNZjVpS2R1Y2dZeURy?=
 =?utf-8?B?MTFUZ3RFMHBZSGZxVlZVYkF1cmNldnBZWENNOVVRUnh1bjI5c2cxT1dQTWJn?=
 =?utf-8?B?clZhQnFxdDBLSDBRYWtnY0x4TGRkODZNeld4aU42ZEc4V0wxK3dhYnNSM2Ja?=
 =?utf-8?B?anZBbWR3anZLd01ENkx6anZDZWdHMXNmelpodWFxM1MzZGtpYVRwQ1lib2lo?=
 =?utf-8?B?czA0OWZDZ3lITHhNbm1hV1hSSDBPdnpOSFRjMy82ZTJNVXh5SEl6N25CU3RK?=
 =?utf-8?B?Z3I2QVV4YlIrUVNLY1c2NEZkSy8rODJMcU40T0NYNkIxYzk5alpGdTVRZW9r?=
 =?utf-8?B?RjFKQWlkOHRJN0h6R2ZYb2VoT01jdUd0akFVZENTZ2FienN1WFhuak83dmV6?=
 =?utf-8?B?VngvTmJ2L2hyajB1OUxUaUlINkRJWnhvakhMU0haRXFLMlRNNG1PSUpiMi85?=
 =?utf-8?B?TUt6b0ZNUTRqYUVvUWxDeVA1aFlxUDZyWVkvNEtlbzAwY0JqSkpaSFdoZFNo?=
 =?utf-8?B?L1BqVUVhamRVcDJrSkdKdktTN2U5bk40MHVQSkFTeDJ2UjNWNFU0aisyNSt0?=
 =?utf-8?B?R3lUeXZkWjJzaUVUeVAya3E5Um9nN1pselhDV3g5UHhCWFFlbUlZbmdDbU1w?=
 =?utf-8?B?QzhtbzJzdFpaTVVQcTJMdzlVbW8ySk8xTjRXTWhmK3JXYlVTaFM2bHRIRGFG?=
 =?utf-8?B?cmh4Tkl4UENkMkh5UFpTY0NVTVpVQ1Jab21vb2xXcjhoSHgvUXZCdi91eE13?=
 =?utf-8?Q?YBxQtObQLDazLCgbEJO6gMVOVdOCidz3JbLRr7kzfneZp?=
X-MS-Exchange-AntiSpam-MessageData-1: wxvlU6r8s+cOkw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3a0e91-becc-4f1a-d566-08de73b0294c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:37.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhNWJGiKK1CV/Ur3Ap14pZ7AvgcgF4WOLsU3iqfKnGkVV7g33PR5onUmpYALfUlZjrlY2e0TGaz0Raaj+ukwHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

Convert the direct IO accesses to properly defined registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 84 +++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index d3d4a7931deb..0a5284d2f5e9 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -8,27 +8,58 @@
     device::Bound,
     device::Core,
     devres::Devres,
-    io::Io,
+    io::{
+        Io,
+        IoLoc, //
+    },
+    num::Bounded,
     pci,
     prelude::*,
+    register,
     sync::aref::ARef, //
 };
 
-struct Regs;
+mod regs {
+    use super::*;
 
-impl Regs {
-    const TEST: usize = 0x0;
-    const OFFSET: usize = 0x4;
-    const DATA: usize = 0x8;
-    const COUNT: usize = 0xC;
-    const END: usize = 0x10;
+    register! {
+        pub(super) TEST(u8) @ 0x0 {
+            7:0 index => TestIndex;
+        }
+
+        pub(super) OFFSET(u32) @ 0x4 {
+            31:0 offset;
+        }
+
+        pub(super) DATA(u8) @ 0x8 {
+            7:0 data;
+        }
+
+        pub(super) COUNT(u32) @ 0xC {
+            31:0 count;
+        }
+    }
+
+    pub(super) const END: usize = 0x10;
 }
 
-type Bar0 = pci::Bar<{ Regs::END }>;
+type Bar0 = pci::Bar<{ regs::END }>;
 
 #[derive(Copy, Clone, Debug)]
 struct TestIndex(u8);
 
+impl From<Bounded<u8, 8>> for TestIndex {
+    fn from(value: Bounded<u8, 8>) -> Self {
+        Self(value.into())
+    }
+}
+
+impl From<TestIndex> for Bounded<u8, 8> {
+    fn from(value: TestIndex) -> Self {
+        value.0.into()
+    }
+}
+
 impl TestIndex {
     const NO_EVENTFD: Self = Self(0);
 }
@@ -54,40 +85,53 @@ struct SampleDriver {
 impl SampleDriver {
     fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
         // Select the test.
-        bar.write8(index.0, Regs::TEST);
+        bar.write(regs::TEST.init(|r| r.with_index(*index)));
 
-        let offset = bar.read32(Regs::OFFSET) as usize;
-        let data = bar.read8(Regs::DATA);
+        let offset = bar.read(regs::OFFSET).into_raw() as usize;
+        let data = bar.read(regs::DATA).into();
 
         // Write `data` to `offset` to increase `count` by one.
         //
         // Note that we need `try_write8`, since `offset` can't be checked at compile-time.
         bar.try_write8(data, offset)?;
 
-        Ok(bar.read32(Regs::COUNT))
+        Ok(bar.read(regs::COUNT).into())
     }
 
     fn config_space(pdev: &pci::Device<Bound>) {
         let config = pdev.config_space();
 
-        // TODO: use the register!() macro for defining PCI configuration space registers once it
-        // has been move out of nova-core.
+        // Some PCI configuration space registers.
+        register! {
+            VENDOR_ID(u16) @ 0x0 {
+                15:0 vendor_id;
+            }
+
+            REVISION_ID(u8) @ 0x8 {
+                7:0 revision_id;
+            }
+
+            BAR(u32)[6] @ 0x10 {
+                31:0 value;
+            }
+        }
+
         dev_info!(
             pdev,
             "pci-testdev config space read8 rev ID: {:x}\n",
-            config.read8(0x8)
+            config.read(REVISION_ID).revision_id()
         );
 
         dev_info!(
             pdev,
             "pci-testdev config space read16 vendor ID: {:x}\n",
-            config.read16(0)
+            config.read(VENDOR_ID).vendor_id()
         );
 
         dev_info!(
             pdev,
             "pci-testdev config space read32 BAR 0: {:x}\n",
-            config.read32(0x10)
+            config.read(BAR::at(0)).value()
         );
     }
 }
@@ -111,7 +155,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
             pdev.set_master();
 
             Ok(try_pin_init!(Self {
-                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci"),
+                bar <- pdev.iomap_region_sized::<{ regs::END }>(0, c"rust_driver_pci"),
                 index: *info,
                 _: {
                     let bar = bar.access(pdev.as_ref())?;
@@ -131,7 +175,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
     fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
         if let Ok(bar) = this.bar.access(pdev.as_ref()) {
             // Reset pci-testdev by writing a new test index.
-            bar.write8(this.index.0, Regs::TEST);
+            bar.write(regs::TEST.init(|r| r.with_index(this.index)));
         }
     }
 }

-- 
2.53.0

