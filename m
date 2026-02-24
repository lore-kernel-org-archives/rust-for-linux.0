Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881F3A0B3A;
	Tue, 24 Feb 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942970; cv=fail; b=ABUZNzjoFIYPI4WcoabbRGSTadRGHbbPlwbZI2X8y6rhSFMIdAQhrU7PeKctkCs8D0l+Mk3CrUeNYaKTOyavcexU3lYUc4EbcVRgRnW9+vxS5oRjXiOD6QGDsSZuyokPMRdOTnnZHXKRZvYfu8iVES+BaJBNXZWL0SOrRpX6/HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942970; c=relaxed/simple;
	bh=/y6RnGW2swTVELS5Nlo+4AckPhk7/L2JAGf26Oc2oEQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KaCrSqhJIaN+/8HP+LohtHqkFp3Au/wrcxTlYQFl7D2u80U+ywHrIGJTaHq+GNVAkNjzRPB8y0gW0D+asORd2xudYBAj10K8y7SkKR+l2CDSRHi/yH6puT31VGKRha36Y5hvPnDKgHaolNTBkfAMtPqzEIxbQKKqoQq+vdcAm1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PKgB5FUy; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PKgB5FUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+YgeNsrXxyg2BPKv9UHe+CQMongTWJMJMb4qgvgnOgypMWrUIfg1IpjWkXU/byoEYFdwc29D/do6Y/JBCjABIQsgrKe20Iq5VjrtEK8FtJLFQeljJYn6Uf9x8nKFRJGFMk69K3KCjacaLSDNxkhEH6yfRTuY7oYgSpT9PjRJNLlXX/RJmW6aW/6ieUDjM9KaKX7tUMH9yAbroIlVTcNT0QnsXfA7Xva9ip0+zZjUjq+3Pdit4ar14U/+h7wmm9tkklXbnzItBSxdnVjVSh1cDVfTzu564UIf9mLugCiw6dVAQ1BHROz4/NskvwiSpHdTZHLtdH9iIyS7bEChn17xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fndS12wnNkUryPM+B1QsCHHaUFfv0ftRDgCYvef62RY=;
 b=SiJgZL/ao+nCdVijypdMTmwtnJb1Zdjh8jMR6rkSCz3ngK93h+btJjbMHWoI7dZDLi5pQ2mtfOX1GeiiMwH0EQg0DUerGZ4KdFxxtWTZlBtlDpo/c1NTPNtzZC1EL6cVptkyKOaTBdzMUJDEYzmcFsiZMzmyX8aq0n6LbSwno7t6v3WpSWL+3y12BQ63h63fPi08LTc4B+sScAzMHR4WmHoGXMV6Z6wiaKLJTDZEU9DntBqMC2/jkDu2pXk9Hf+jhQaDdQWfy9ubGpVG+Nrhn7LWkF00AV8JPSuqP7186wf9MfKSxkt/bYaWMrrLT4bQR4+F/pKnyAXg00BLtikqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fndS12wnNkUryPM+B1QsCHHaUFfv0ftRDgCYvef62RY=;
 b=PKgB5FUy52OBJqt5nppdBQqObuyhEFO5ekE4drJEJATz79y25bxgzHr3dsH+asbmi8M8L1dK3JrHevELd7QnNgsCyhaCNpkmHZYE3gCn/2xzZU7/DVBR5ohx6A6ORamFe2BeUWuDpuSmj2IDjRPlf8ujDg0gcsnAmu4l1ck87b8xffcsYCkpJhlvCekNApOKUq5GubwOngSpqeaU15bhlCT/wBGq5X/aMwQ0XSy4N/TkcbCyfGNt5llfoztATY2vwUwDckCrv4DwTml48Hn1Ca1KyDhEpMrsizM7s3H+mbhzDT/3FPoEHVuvxh+Iklft62NNgGXUaOmYbm+g6FE9jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:48 +0900
Subject: [PATCH v7 10/10] RFC: rust: io: allow fixed register values
 directly in `write`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-10-aad44f760f33@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0070.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: b8134b38-da19-43a1-03bb-08de73b02dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDI3OURJVkUxdkRTVzZhcTdkcTNkZWtZb2I4bU1SYWFERk9RTW82YWpVa28x?=
 =?utf-8?B?RkV3VklrRSthNTlZeTBteWVTTkpoYXI3RUwycS9DRGZCeDdXakRwM1VVamJv?=
 =?utf-8?B?OXArM1dzY2ZsaUt0a0tHY095dlpZbDBGUVV1aDFxR0JaUzBuS2hYdnp5Wk1v?=
 =?utf-8?B?Y2FJYmVMYjhSUHlBbUo2L21DdnRPQWdGSTN1S3h1ZDZEQzRmRm1JTGZMV0lZ?=
 =?utf-8?B?MUw3dlhSejZJWStrNFRqZ1hzc2oxNkYyZ1QvVmlwK2FITVNkdXNDeVMvSzdD?=
 =?utf-8?B?MHF3WHI0alZvNzlLWWZLMGdWMEFobjVIU3BJdlhpNTB5RG1FSm1NSncxS28w?=
 =?utf-8?B?VVFFdjh4NUdDQmxQbWd1Nm5HNzhxc1lRU2hNSitGT21zY3V1SURUTjcxUHFX?=
 =?utf-8?B?emFHbTZTL200QjR1SkREbVBsaHVYOVlHTERwQVQ1eU5SRHAzMFN1ZHR6N1R4?=
 =?utf-8?B?YmxSNGNTd3N5aFJ0cW1ZTEtPM3d4RUpRaXlBa1ZQczlWVnZ3SzNNTEw2MWVn?=
 =?utf-8?B?U1hzKzkwbnNoWGNPQWFtN3NJTk14bGFQNkp4ejZiYUR4TFZHR3J3cytYbWF4?=
 =?utf-8?B?ejc3TStuQmZaMFVIeTR4TzRCaEIrb21ubWEwaTRvWlZTVTdLaWVWWElvMkpB?=
 =?utf-8?B?cVlQTHFVNll2Umh1VVZ1NUtsMFJhcTlXTjNWM0RkQ29ONXpwcERJeXhiWW5s?=
 =?utf-8?B?REc5SXR3bUhSdXNSeEJ5UzYxcVM2dUNwdUZtQVhpZnBKYlh1VG5HSHB1dzZT?=
 =?utf-8?B?MStMci8wS0JiNWJsN2d3ektvcU5DM0l2MGZzT2dxMEhiM0RiNTk1OWgvbjB5?=
 =?utf-8?B?Vk5icDZWaG9teFF0SS9FYk5uRktxNU1PQ2phcUlKclBLVGVDZ2JwZWMrMS9s?=
 =?utf-8?B?ajQzRzFTcXFSSUowU0JZc1l2bjhSd1dRU29NUkpGbzRPZTVjUFYydUx4Yllw?=
 =?utf-8?B?eGZYV0JWMUVyWWUvNHl1aC9iNUlCdkpDQUEyZnJramJFSEFoMUJad0Ftd3pt?=
 =?utf-8?B?aWErV0l2Qi9UMElIaEV3M29naTNMQ3hySytRUk95Q29CclFEVktOM2JqOXQw?=
 =?utf-8?B?T095REd0SWI2MDRIVGoxQ3dSTWhUYWZjS25GRUZyYlRWK2M1Z0xJSkpwOUJo?=
 =?utf-8?B?S2hYRER4M2JIekVLTkROY3krYVhkS2lEM1R4VGQ2NEhNUktkaFB4Z0NjZkU2?=
 =?utf-8?B?a3J1SHE1WExTTCt1cTEvVzJ0cmQxaHhtemJxNE9xUERQMGNCNWtGYVVhT3FW?=
 =?utf-8?B?MkU3OTdhQWJqRXJQWHExdVI1d0Zhc0NJRWFYc21YUWJhMEMvcVZ1QlNiRzFY?=
 =?utf-8?B?ZGlLdUl6VFV5K2M5cGwvdzhld056emtaRGo5cUpoRTAzSjRGcWVNQU4xbStZ?=
 =?utf-8?B?SzFGeTZQeWRZOHpWUjVRa3BSNVlXZnlXL1YrK1diSWxMbDlMaG9SOWFOcHdk?=
 =?utf-8?B?WlpaaG9IaDFRSFYzczhsSWdqTUNrMHM2VDFYZnpJZjdWK1J0WThURlhyTmNZ?=
 =?utf-8?B?ckJtUGRGZERxYVJhWTM5SUo4eGJRdmlpMDd3ME5CNGhPNGNhWXN4ZmU1d0V1?=
 =?utf-8?B?MXEzWEFlWmp6d2w2dC9TOVc3RC9XWE5mRXk5cGhTQWVvWmFGZmlRaWU3RDRY?=
 =?utf-8?B?ZWhiYXJrcnZsQWNzQURId0NvUThNVHhFK2JDZUxVMEFvcEY2TmdNM2VXUGQ3?=
 =?utf-8?B?bjJYbjYrUHR1ZWd3NjE3WDFJeEo3Qno0Q1krVWtRajZUMEJPektvM0NFVzR2?=
 =?utf-8?B?cm9YTFFpUXlpb0FDaTQ4UmZrZ0JERjBVeVRpeU4rT1RwK0szUkhwRHd2ang4?=
 =?utf-8?B?c1NPZWZpTGpUMXA3ZHkvdTNkQ0RzN1hIYnZpcmdUQlZhbFA2ajRWMEwxamU2?=
 =?utf-8?B?VW5ZWEFDTjZsRVJERjhNZHpUZ0VzSVMvR2NPZENEOENrZXZ0a1NVeS9jMkhv?=
 =?utf-8?B?cUZJRnVORWtYaEkvSDkydEhCeWt1WUhWaG5IbnhYQU1GeTcxcnhrUVZySmdp?=
 =?utf-8?B?WVlZZzE1eFNSS3pRbFZybkN1U0xlS0hnZXA0OTlzM2QwVGxzR0FQMXAraEdE?=
 =?utf-8?B?VUNweUNJV24yZnRxYkNnUFdWNjBIZStGSmRZeUVFVEwwWmdrK1E5MWVGMDFK?=
 =?utf-8?B?eEVwZzQxaFZiQmRNdkhxaWlmYlhJTE9uM3Z1b2dmZGhGR3lsU1ZGWlc2K2Rj?=
 =?utf-8?B?cmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVyOTVHYVdpRU5ra3JjeVh4c2ZQbnVLZ1MvTHN0MkxKd1c1d01OMEFweDk5?=
 =?utf-8?B?UkJSU1dPcVdRRWpxYUgzZU12WGJkTHBLSEIxZG02WnFTemZpMzQ4WGZxaUhW?=
 =?utf-8?B?RkhiOXJEdGtKQTZMRTJEN3l2TTZoU2JJeEQwMTBOd284R3JIaCtPVlFmTjNE?=
 =?utf-8?B?MFVkZWR6SVlWTFBVUGJIc0tYLzhueUg4TDlIS2xjaHpUc2I1ZFNvYXNFaUln?=
 =?utf-8?B?KzFISUYwdzFLTk11VWl3S2ZYNUtJeVVqa1VIQUNrWTdJeGRFNE1wWjlHQzdW?=
 =?utf-8?B?MTBCOURRN2grYTB6aytCZ3pISGJrMjlWamVIT2hxMll0UXdrU1laWGZNNGdw?=
 =?utf-8?B?c1J5WVZOaExDbWlxblkwZllsemswUFc5dmxjb1ljZzJJYy9QTFI2Zkt5N0ZG?=
 =?utf-8?B?RlplTnlGY3paWTl1UTVTQURVTnhpb1Brb2tKRGRLSlVGU0JyYnVSVCs5OWtQ?=
 =?utf-8?B?ek9BbUFTcmJKTllLT0FVeXNjQkR3dlRxUk5mQlFOM1hPYXF2YS9kSzkyemtp?=
 =?utf-8?B?SkwxeEJucXVEN0gvYjJabEphdkRBZXRDRlplODMyKzVqTVU4N2pFTkZheWVV?=
 =?utf-8?B?aWV2bUhrK1ZTQkE3MG5Ma2dkMytVc253RG5HVElYaHFMRnFKWkxLKzdJaCsy?=
 =?utf-8?B?aVFRRFN5VHEvamkwODhqTGxvUy95YjUxZjBGb09oblpJTVJBb1pWZFkvOXY1?=
 =?utf-8?B?MXhjV3RGSWtIN0M4WWlkcVY0ZW1qQ3RtWTY2bEIzQ0QvWHdySWZCeG9USDN1?=
 =?utf-8?B?VldIK1lKWDdvQ3d4eURKS2hKbDlwNDNuQ0kybDJLYWMzaUdUbklHRGUvTUtU?=
 =?utf-8?B?UlROVitPQTI2bU9MMFhrRklUVnNMQ0s0K2lBeEZvY1ZYb0FHRnJTbW0zNFNP?=
 =?utf-8?B?UlJTdDgzWGljVVF2eGVSejdDL3ltM0FjTFBiVENsNkNKNVovQVhsZXZWdFZu?=
 =?utf-8?B?a0FBelNDKzdNWXpXcnIzU0psbDZVU2dKYytLRExzd2k5WlZ1d2Voc1NyenRM?=
 =?utf-8?B?QWd0ZGNnZTVNdXh1YlFwYWs5QWNCTjJ5WDBhclRwVG51bjhlUldBeDRUbFVK?=
 =?utf-8?B?UFpLZHFZaHQvdVZpbnNHdFBhSmZsV24xV0JHQjZvNS9xdzg4ZytKbDBiTkZX?=
 =?utf-8?B?OTdvMXY1N01vajdDT2pJVUJLbGVWWDRyWFA5eUlQdXh0OFltQXowR1lpQk5O?=
 =?utf-8?B?R2RBZVdnZmVJeEFwamRaY3AxTmJ1RnpXZm1ZNkVLSy82WXR2Rm9UaVVvRG85?=
 =?utf-8?B?WlI5a0hIRWo3NWt1Qkhna29vdFNsMVNpUnpGRFJDMzdYUG9Xd1ViR3VKdDhU?=
 =?utf-8?B?Qy9rT1hZbHBiOVZxZFYxRERMT0xSZ2U4WGVSWUw3MHhxa1ZVYlkrRWRyeElB?=
 =?utf-8?B?ajdNdFNzbDBFbWl4b1VRa21Nc1czUGxabUJkNXVrN3pRLzZ0djhjKzlxSW5X?=
 =?utf-8?B?bkNsS1cvVmpmbEZORFdITDRybVZCb3oxeUpNRmQxVTg2TGdLVHhzVGJsUmJu?=
 =?utf-8?B?bCtXcnY0WE9CS2lZQzFoT3R4TU9hUFlSUmE2MS9OYmpnOTV1V1B6dGc0bWZ3?=
 =?utf-8?B?MERYRW1JSDdzSEFrM283K2RzTGlHTVduZi9tL3FaNGlRaHdxem94ZGlIazJB?=
 =?utf-8?B?dm9DMmxCOTJoMWxPUmpmN3plNkc2Z0sySHQ0MEhGbW02UWE4UVo0RUpUT1pa?=
 =?utf-8?B?NCtrS0tJTTUvc3FoRGRRSTlhL0RtT05QZVdBUExNYjkrZTJVMFdIdXArd1J1?=
 =?utf-8?B?OGgrbTU5UEFjeElIUHdZR0VNV3hweng4ajNhUFB1eTBRa0lBZHdSNEhQUk91?=
 =?utf-8?B?QnJQSklEaWpyYlFPRFpWNFZOR1BIZitocy9zK28zbFFmYURwOUlQRFhQajYy?=
 =?utf-8?B?N3NNS0tQbjhHTUV5bDYxb0JjNUU2ZlBLQTg2MjNaRWhRN01scXBESCtaaGJa?=
 =?utf-8?B?cWxmbldyTFZOTERGaFRSS2xpL3JxZmxUSjNOL3VDeWNBUFhCN2h6cDZuakVF?=
 =?utf-8?B?L2RhaHNtN3RqS0R1OS9USnRiQjVmRlRYQXVycFVCVENuTVgvaHFCanhEakNE?=
 =?utf-8?B?N3Evd1h2aXA0MUFvUm9HMkZJdU80SENOZ1JhcVorTDNSUHNuZU9hL0pQeHhJ?=
 =?utf-8?B?bUVwbzlJSVh0cVJHK1JhSkc2N3F3VUZjREh4d3NyNUdoWVpERWcvTHl3TUxo?=
 =?utf-8?B?Si9JNXQvY2F4WElVMUVUZGttVVdZTEJKRzFzVHMyNVNJTStRcGVyWkhKd2lB?=
 =?utf-8?B?enFqWHdkTHUyZTd3TjA0SkYwL01LWkdybjNmNWdxWUhpOFc2N0cxTG1JTFpQ?=
 =?utf-8?B?OGxlTG1oenpaSTFTKzBZUzZSWnRINFpDR0xGaHFNMVJacUlCcWtnS20yVSti?=
 =?utf-8?Q?BlwNjFcByoQFmZiPyTo/mPYY/HjpSZVj9wb0YBZi6FAF8?=
X-MS-Exchange-AntiSpam-MessageData-1: 0LWo4aPaNW8DWg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8134b38-da19-43a1-03bb-08de73b02dba
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:45.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soO+gfbmvJyaYYGAeDURm+U1tYJEfosNJiV3O3suCSccOjoVlVxL5pUrbCDOHGBtQdRsyPX9mtxwXyCh298tiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

When reading and writing a fixed register, we end up specifying the
destination register in the `write` operation even though it is already
carried in the type of its value. I.e. we need to write

    let tcr = io.read(TCR);
    io.write(TCR.set(tcr.with_unf(false)));

when the following should be enough:

    let tcr = io.read(TCR);
    // `tcr` is of type `TCR`, which carries the offset we need to write
    // to.
    io.write(tcr.with_unf(false));

This patch allows the second syntax to be used, by making `write` accept
any type that can be `Into`'ed an `IoWrite`, and providing the required
`Into` implementation for fixed registers.

A similar trick could be used for relative registers if we include their
base into their type (not done in this patch).

However, array registers won't be able to use this shortcut (at least
not without increasing their size to carry their originating index),
which introduces a slight inconsistency about the capabilities of each
register value. Hence this RFC to discuss whether the syntactical
benefit outweighs the consistency cost.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |  8 ++++++--
 rust/kernel/io/register.rs | 14 ++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 690c25de979d..b83472846d3c 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -545,12 +545,14 @@ fn try_read<T, R>(&self, r: R) -> Result<T>
 
     /// Generic fallible write with runtime bounds check.
     #[inline(always)]
-    fn try_write<T, R>(&self, op: IoWrite<T, R>) -> Result
+    fn try_write<T, R, I>(&self, op: I) -> Result
     where
         R: IoLoc<T>,
         T: Into<R::IoType>,
+        I: Into<IoWrite<T, R>>,
         Self: IoCapable<R::IoType>,
     {
+        let op = op.into();
         let address = self.io_addr::<R::IoType>(op.loc.offset())?;
 
         // SAFETY: `address` has been validated by `io_addr`.
@@ -590,12 +592,14 @@ fn read<T, R>(&self, r: R) -> T
 
     /// Generic infallible write with compile-time bounds check.
     #[inline(always)]
-    fn write<T, R>(&self, op: IoWrite<T, R>)
+    fn write<T, R, I>(&self, op: I)
     where
         R: IoLoc<T>,
         T: Into<R::IoType>,
+        I: Into<IoWrite<T, R>>,
         Self: IoKnownSize + IoCapable<R::IoType>,
     {
+        let op = op.into();
         let address = self.io_addr_assert::<R::IoType>(op.loc.offset());
 
         // SAFETY: `address` has been validated by `io_addr_assert`.
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index 498cb3b9dfb5..68e6ff1a2f89 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -305,12 +305,12 @@ fn offset(self) -> usize {
 /// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
 ///
 /// // Update some fields and write the new value back.
-/// bar.write(BOOT_0.set(boot0
+/// bar.write(boot0
 ///     // Constant values.
 ///     .with_const_major_revision::<3>()
 ///     .with_const_minor_revision::<10>()
 ///     // Run-time value.
-///     .with_vendor_id(obtain_vendor_id())
+///     .with_vendor_id(obtain_vendor_id()
 /// ));
 ///
 /// // Or, build a new value from zero and write it:
@@ -806,6 +806,16 @@ impl $crate::io::register::FixedRegister for $name {
             const OFFSET: usize = $offset;
         }
 
+        impl From<$name> for $crate::io::IoWrite<
+            $name, $crate::io::register::FixedRegisterLoc<$name>
+        > {
+            fn from(value: $name) -> Self {
+                use $crate::io::IoLoc;
+
+                $crate::io::register::FixedRegisterLoc::<$name>::new().set(value)
+            }
+        }
+
         $(#[$attr])*
         $vis const $name: $crate::io::register::FixedRegisterLoc<$name> =
             $crate::io::register::FixedRegisterLoc::<$name>::new();

-- 
2.53.0

