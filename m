Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D752F0673
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818598; cv=fail; b=hWqeaAxGlLdx+3/TK94C+VsSh7sVruL4fG9IRW4EDSBwndi1ItXCt0FIJJ8Vpu9oxk8Aw1KAmzRwEHeRgvLQAB+s4N9+6/xfwYXzyr4ocddkVdTg1AlRCl8C0T42iLC924kcIIbH+josMMfPLILAaYFF7EazEXWsOCcKt/vMU+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818598; c=relaxed/simple;
	bh=Do5FIf/8yDuZpfRI5UoWgIMQbDI0m1tVsOOodqJ3adQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OLDTXPCfiytiaaFoAU1bDxfAbXRFaVr6hkK/yLm+1vj2sVy8zUPOHzbeolc91+OOqHYxYydnDm98VidHcAWoEbGYgS+xrwISaFfy1BlpUg87tGiTcmZ5IlrzWByxUONIMMOJz5mubGsc6fRj1KNs/HdH5TxJAy4rvoQslH3OR24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gnh5eUCM; arc=fail smtp.client-ip=52.101.48.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gnh5eUCM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtC84euT7RmbQXxRHEn4GMy10Fw2061Ps/yvAKMlg7owDzVTiESXeo0+QmMTSwrPUa752WA+IPVKVGfiyvrMEhLnLUZhgdDw28zYqcsyBM5AGjzxtYK/Iu6xzbs+iKq/E+rIAHAknEJ2gtp01XVSTm7zNxmwjNDEAFZvdfDmSAkg+x+a24zDX13YBiDiZ1qVr3p2aNPr+rLAaLL91DrPaOeQyX7tqCZx3i78XLbJ3ZvNhneLuRrZHf6ySWalTh6xvWhVmEYEqQ6QZWUts2Z798Yg57AD0O1U7up0R0gPNPa/OXG7MsuHVvEt1hrjuA9INbIE92aAUMnCk3l8vM/UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP8PS+Pi8mc189PISAggAKpqw3p2gaPUopWi5ChPnTY=;
 b=pJdsFBHPuG4vMTQrsEwQq+YW0nmLWvZWBC0uZhSSjZPssASVhffB4wGT2VdhsibHUiVS4w52HCiZi8oAu/IqG159PexamrQ7hKZA7LFza6A/kC5E+yNyM3R/NepJy4leXfG43KIYtWa6UB73RftjIiz55LClozd5b7fGjMNB/kcZkzTUFxGW1zlYS1F/J2rQbQSezz4tevWXveMDh5f5UeobwNdkPkyPyJ0ceTxfgxMx+pv/YJZhdr8XjlKkNfxxMGod1idNWwxMqZ4mZ/5s0EWDlpDM1kW7xEPZ1ec/Rx+nEPD0YLU1EUOhmzvXV7wY/ZOS/0IY4JAMibarVE+Sew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP8PS+Pi8mc189PISAggAKpqw3p2gaPUopWi5ChPnTY=;
 b=gnh5eUCMUQZZeWsGZAebKAPzB9UzEPIHPbqdhKARRk5cP3f5TD5ngKHYSjXeaHcc8OE95JGmIYQyMwQ+1V4ypE1lT+HrvJnp4JmSd8/lCJEE7JDRTJ61HzJr6ntMb/Qtn5bS28yJfxUSm2xAorPgK6wqW9HeFNYQvCdMewadjMfAHg0XIzFhP3UzvjiHOMkglOlmZy45JcfpqKwFlJsZVHqcejPC/k7ZvetTD9ZUPHXdqsRpd8ZqYaRc0Cfhn4b1nYjppFghTIfoCYspPiLzPvHLMP2SQV4u5mxzuZ/zAvlktNGgMDfChXeXqmoE6K30kRA4WthaWJCLyISSiTQuEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.8; Sat, 31 Jan 2026 00:16:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:16:29 +0000
Message-ID: <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
Date: Fri, 30 Jan 2026 16:16:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>, "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f61bacf-48a9-4f54-f7e9-08de605dfae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2pVYUlVVlNaUE9jODBFYmh5d0ZhcTJXR0VoUEtZbGRYcDU0dW1uSDJhaS9u?=
 =?utf-8?B?ZUx2UUhsdEwzVE4xWGNYZ2pIaml2eURIM1AzYWVaMGh4UGg5dmZnTzI1TStI?=
 =?utf-8?B?MTA4ZXM5VzdrVnIwbFc2VlFRZWlTQWlBTVlBd1pxQmpheHJKTVpzeXZ6KzB2?=
 =?utf-8?B?R21JWGVOMlVlcmN6bFViQjJtZGNJclJWZDNEMk9wR0lwd05ubW10V0tHZFZQ?=
 =?utf-8?B?ZmxLUUpxeTB3TDdpREZLN2NxYkMraW96NzhaMHI5TU5UOHhYL2w2SndoWjFs?=
 =?utf-8?B?NnlrNHRyUnZ4NmlTRm9QZVFVMEltZ1dDdTFmTUczSFRSaHRFVURiMCtVVDZM?=
 =?utf-8?B?dzRkSGJETTNpallsblZVQnVwVzNDaGpOLzN1emVGL2RqUC9YYVFVejJuRUNT?=
 =?utf-8?B?bUJBcjJuMms1d0tzUjh0WUlZKzhZNFdpdlZwTExlNFJvak5NYTBONUhDRzNw?=
 =?utf-8?B?b0lQUTNVMkkyc0trRkdoNGd4dG5LeTZQOUZNek5TZWRSVFkydW44MmhwQWNZ?=
 =?utf-8?B?VVFFczRudnV1c0Y3dTd1a3lkUUJwUUJ4RnpxQTdOcHRFbEVBUk9LUlBYcWht?=
 =?utf-8?B?WERJcFR4QVovZzBjREgvcUtDMm9LVjZpZEpmTzZwTWs3Rk0zTHhvTEFZZ2N0?=
 =?utf-8?B?VnhMN2htVEU4Z2FOczdnc0ZKNllIU2hTaVdtTW4zUE5ITUQzZG1HSHpZWnBw?=
 =?utf-8?B?K0laaDh2L1NtaHJEMGFJbDhvalRLam1pNmZrUGxMbS9rVnh6NEtDRHVrQXNo?=
 =?utf-8?B?bEtIU2RPbGJOUlRidVpNQnZJeWtxOVg2R3VBVS9RNy95THdCQTlyb0FSMS9C?=
 =?utf-8?B?bEhEbGNoWkhTVTQwNVJqQVFMVkFvOHBudDNxekRBM1YxZXZFbU8xZ1JTYnZi?=
 =?utf-8?B?MUpDQ1RXYllGRTBqVEQyMm5LV3ZIMWRSRy9ZdllmNVViUGRpME1pajFPa0pa?=
 =?utf-8?B?cEYvd0FPQ0hYR05YTWhDN2JUcFpQcHpDeUpETmVCODV3Z2xWb3pXVDVlSEl3?=
 =?utf-8?B?ZncxR21WL2tVcWJRYU8zR0JQVUFsUDdBTkcwV1g2QXhoTmZVOFpGcG4vWXo5?=
 =?utf-8?B?bmpFNTNaWTFzYk9TMFdvdlQ3K0o0bXRTTkJseCtPUFRGVDE2b1IzZXVuU1Zn?=
 =?utf-8?B?NzdIQWhKaXM5cmFvYnRYaHdLSEdoSkRsVTFrSlpXNWtMN3gwNURXK3BVZ21x?=
 =?utf-8?B?ekY1aFk3blU2eVdtSzJyRUF0ak93cVN2MzIrc1I3NmhLREdOZTVRZDlCSUN1?=
 =?utf-8?B?NzcvME5mUE5EVW0rT1k5aHREa2ZSSjNGd0FyUVBtNHVEZ2JzZW5IYndkSjBF?=
 =?utf-8?B?KzZkZmNYUGRlWmdqM3NhbzI4eTFqRnNYNFdWdHlzMDA4SzNUamxYcldVeTdN?=
 =?utf-8?B?aXRJd2pEUEc2QkplakZOZHRTenRUK2xHcnpHQjRld2k2SlVYNXRIYSsxdWdi?=
 =?utf-8?B?ZkhFVFlVYTBnQ0lsUFRmb0xjVTZaNkZYM0djQmNiNE9lT2NiQUU2bis3cnZ4?=
 =?utf-8?B?c3JVWllhRW53MlkydzlrTHUybHNzRjY0bU1jUXNzYml1Wk1MQzNVcElyTFlK?=
 =?utf-8?B?SFQyZVNjR1k2b092NXRsbVlzQzgrZGdieHREaTVHMGMzSW9yZFNJRks5N0RY?=
 =?utf-8?B?dlhLbFZDcUk5K0FZbzJGQWxHZDcyU3llL3pjZ3QrcVA3Yi9DalJNTlpvclMv?=
 =?utf-8?B?bVhMMTNpSWMrNG9TWEpiaTI3RHdSTWFSVXF6bFpCaWtCVi9DampYdmRITkx0?=
 =?utf-8?B?Nm1HVlZtamxqL09ma0FST2Ezb1k2YlBUcXZhTzNkQ0gvVWJxeHNQVGhIWFB4?=
 =?utf-8?B?RHFZVm0yRjJQYm1SaTlRNXJta2N4WE5YWHJlbmx0eTNGc203dWdnbUpRdjdI?=
 =?utf-8?B?ejNDYVRGd1l0eFpmaVpSMjMzVnY1SUtkeldTVC9MalA0c1RheE04NUd0MUhB?=
 =?utf-8?B?eGEwQVJTcU8vVnR1eWtNdFNiSlZUU1g1ZFBoS1R5VUNhVkNDL2VaWExlNGk1?=
 =?utf-8?B?ZW1wUU1SK2lHVWxXejBKYXBWNWREdk9JOWlEa0UrbWJldVJrZ0g3elc5YWJS?=
 =?utf-8?B?MFAyVUw3U1d4bkNtMU93RXZZME5PRnNiRW5BbHhWSWFUTnl1Tlk3UGd2VkVr?=
 =?utf-8?Q?jbyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azBPZkRpSVVFRFhtVUczSm1tUW9Gdm1rTlo4aXdZZkVOa3d6bEc1c2xEWDlE?=
 =?utf-8?B?VkRYNFo1L2V2cHVoT0o0NFZubTNRZWlvQWczK25STUx6bWUyeG45N1J1b2NQ?=
 =?utf-8?B?a2o0T3k0TjhnQmoxaGZpdUYxTDJLY2U3dlFMeXp4NTFNSFJXS0dBSkZJYnpw?=
 =?utf-8?B?ellxeHdjcXJTMDc4RXN0VDRMeDFrcjNVdWFlZGhJSEZQQ01UdEx5ZTBNZXNs?=
 =?utf-8?B?ME52WlFGT2F0WmZ2ay8rb2U2eFlsNnBoVi9taHRvQWNXMWdMZzQ2aWNybWJI?=
 =?utf-8?B?K1NudXpoZUZhR2kxSDduTkRqMnZxRFRsYlM0ZnVIalZQa2FYZEtOcnNlYkl2?=
 =?utf-8?B?MnYrM0dsVCt4TmF6WFNMN1FVVzJEZGpxblBIRDdiUHpEUHBRbEhPejdIVTF4?=
 =?utf-8?B?MmlMcklHeHI1S1RvNVhnWmJpUktTYkZpa3c5NHU4d0tvU3pjUjV0dFlkZ0g5?=
 =?utf-8?B?a2hvWmN4dlcvdjVtUlJQTFVMMnZvS0VhRUsrNE9iSUZjOTdXQjRVTzRRNVc4?=
 =?utf-8?B?WnVVdGhZdUt6UzhWSVIyaWFQT1IxNUR2RWVmemswOWFYU0sxUDBFOEIyMEtX?=
 =?utf-8?B?WGVoZytWak9PUHlsdmZTUHdHd2FESkxIRmxGK0tDbkRFUHZJWTkvSFBWa0Yx?=
 =?utf-8?B?dkFOay9MMUpFWExCa1ljTVlsV1lNcTViQWxha3FOL0MwZ2xvNTRsc2tPcGNr?=
 =?utf-8?B?N2FYc3RZRDRyR0ZPaEVoVDkvMWJsTWMwa1NRZ1FUTkhHRkJHbHAvSi9tOCt4?=
 =?utf-8?B?KzFDaDVHRDBVQkNTQitibU5Ma3V6QlRUMWdpaGxxS21BYVArY3g4RlZycGxQ?=
 =?utf-8?B?Q2JsWC90NnVFYnVoY1piTjlYSTJ2YnpUN1BBS0R3TU9PcldIWXgrNUJLQmlZ?=
 =?utf-8?B?ZDV0QWVmQUJPR2RoaVdESDlNTVh3TjdFY0RVRktXWFkvdkNyRHRLajcvUlVL?=
 =?utf-8?B?UktwWERzS1BZT2NmRittLzNrcnRGTXpoNXJXci8wTGs1SDk4Vnp4M2g4S1NR?=
 =?utf-8?B?SW80QjBSaDVReGtUbFVxajlIRTR2VkRQSlFDM0Rpc3lRak9iZlo1czQwVjMz?=
 =?utf-8?B?Qm9ieWo3dHMrZWQrZ2dEMGxHS3pubDMrSGRqK0RBOEVWSXhLUm1mUjk2YnRS?=
 =?utf-8?B?WGMwb3N3UnR3R1FwSEIwYStKamI3NGdLUEQvWXM4bDVjYUhobStPM1I4ZmtU?=
 =?utf-8?B?bXpBV1Zab2NoRW5JNHdhWWpINUVFTkpncnNQZnM0cmJCMWFtL29tVkZld1dO?=
 =?utf-8?B?bEpnTVZuV2xaYVdtU2VHNzRWRCtRcnlxTGJuOGxGNG9BTTZMZ3J6bXl1WkQy?=
 =?utf-8?B?WmFvMDNlRnVSZnpaeXlWR1Jxb1BFR1pKTXl4c1MxekFRL2FEYmtlREhJcktx?=
 =?utf-8?B?dENjTU03aEFXZU10dmZBVks0MzhNSUpUMUFEUHpnQys4cGtsWXJoUmhjZFlp?=
 =?utf-8?B?SllQS1lSNThjZkVNVnlkdDJtYjJvN3ZjcnhSNGV6T0E2M0MzMkxuN2F1R2E1?=
 =?utf-8?B?ekh6ZFVGS3ZzcnJRTEVtTEh5WVgwU2M2VDhNb3YzYW0rTUozOWkxSCtsMWNF?=
 =?utf-8?B?cTJGZXdDZ3RKVzBFUjBnZ1U2UytYRXRXeUdhQndncWdBRng4c0tNcXpuMkVI?=
 =?utf-8?B?djliM0tReFRDc09rNkg3YjE1bWtNV1ZjQ05vTnRRYW5rZWtyd0lDWk1ldFJT?=
 =?utf-8?B?aDQ5WTg2R2taTE51cFh5RXlNMDE3Z2Z2UUk1a3J0T05HM1dBMisyeEpyUFZW?=
 =?utf-8?B?Yld3Ym5ZVFpHbUg2UnpTOEI5dVEzRXJIZlR3eEhFYThOSkFhcGhpWDF4OE84?=
 =?utf-8?B?Nmd5Yi9VOHc5VUVTZFExemJUVFZpamRVUjl2UWx6U1BqVjFEekNGNEw1YmQx?=
 =?utf-8?B?UTY2aE9xRGlBYkV1Y0RibUxzUjVtU1JrcEQ2ZEJETExFZU12b3FwT0hGQ0pj?=
 =?utf-8?B?a2JjWmw4SmQ2OC9OQmtaMWxjTXdNS1VWQjk3cUpzR0psV0F6WVVQUktDcUFs?=
 =?utf-8?B?VzdoQ0V5ZXd0R3UyTEY2d2l5TTZFUjJUckJNWXFsZWN1MXFMcFk2NFpOblJR?=
 =?utf-8?B?MUZXWEFIODVGV0Fya3VkMkh3ZDhhbm10S3BXRlFPbVhwdXpyUjBCejc5Q1Bm?=
 =?utf-8?B?WVkvUzAxanBqVXA0ekZZdnREN2FvYVp1ZEVXUmxha1pLV1YwRkFOR3NmR2cy?=
 =?utf-8?B?T2Rsa2p4dWdJSmU2ZFpUTTFLVS9lR0hvSDZaYVU4Q05iVkFrd3dsZFkyUnVz?=
 =?utf-8?B?Z0lLTXRlWCt3Z2hXa0U4RW83a2krSTdSMVpMV2lsK2RSVWVrZWZEalZFU0d6?=
 =?utf-8?B?d3dpb3lqY00rYzd0VFQxYmtRTEczL2FjWWVKS1diaUw4bnVxVFpYQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f61bacf-48a9-4f54-f7e9-08de605dfae7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:16:29.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEBdJRrvvM2gU63+Cf6pcnHexAoybnczDviYNqCOn50+Y8MNAYNuMKXdXTg8aP50yDJa99A+NVUk1xG/BpDUdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229

On 1/30/26 4:10 PM, Danilo Krummrich wrote:
> On Sat Jan 31, 2026 at 12:58 AM CET, Gary Guo wrote:
>> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>>> I think there might be a problem with this code that I don't know how to resolve.
...
> There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The only
> Kconfig we need is for retaining the GSP log buffers after driver unbind.

Interesting. And in fact...I think we can live without that feature,
especially if it complicates things here. If someone is debugging,
and they need logs, they can usually (always?) find a way to leave
the driver bound long enough to get them, or so I believe after
some experience doing this. Yes?

thanks,
-- 
John Hubbard

