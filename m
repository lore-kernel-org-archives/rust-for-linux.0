Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3CEC4
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754624974; cv=fail; b=CUhuTexiM5dg4VLgM1qP1wbJK7N7QD0OQxDff4AZLUOPqBX0Y9igoJVwXszBJ14/Du5y50lunBf+crahv5E5vMc9NgEb9QHOFzcZSf+Te5sZ3tOj5DA/b37H95c62t/ozyh5thOa+5bNsMNXbwGcoSqEN41wrwqi96LkISKz5PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754624974; c=relaxed/simple;
	bh=HYsQjhNOV5JORLWam4ewF4CYp7U3YuXxs3DVU7OThZM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=KWJah5LI5k2vOwsi4G23htEfhzo27FqFfLA8fpTWZK3hVHcW2l4sUF7sBiqr6a9ORZpNiWTVlqJp/aXSfdCZVxCYqMs4PAHXoyPt2QETLG6yxUTNkPK3LXpymlfhH5mbAS+2gCH4ra8Rw1KID/AW24sO2zXkcnGZaZagZ3qo/vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ruYkpnqp; arc=fail smtp.client-ip=40.107.237.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ruYkpnqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NboNcYIkItY4V4jx7H0A6459JYW8LV5jsWDpK37tT0AXetIsj4Kna7Q6HYzQQC9YmgzXwRNGO9wsGQ/5cKDoOTQIMxDEAoZL9c36C//EFfXAIrOOwX1pf+pzlIVGlN75ZW310KZImYa7shleRtMn6+fLKH8x7cSA6OY8hMSBXrDvKsEgNgHefoszA/+9tUSaQQP6nbiyxORgSG1JFu74IMO4FFgF2g9GY/wvlUBCMnBZbz8zJ4DyRf2ZYQ0og2jyKwq3xkzEbC7DMdtGkYooxPvvBBroh1jI1/ebw8imoZ1J8eoXcKt8l/dYRfnf6DEoWfhkUAT73xpge2JW8FJ1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYsQjhNOV5JORLWam4ewF4CYp7U3YuXxs3DVU7OThZM=;
 b=AWbJ4x+oxZu8NbCwoBW5gOpu4zDxCViYb1slGQRPyqeFTAc2c+q4qfgSu7s5tioWXmoKGjYDKE8/syKVggwaeVs1SmoHcVOfy8/hbResJwVtsPNH5UQ69O1C7a+SEGPuD3sUR8830C3iBLJKAmOnqMFV5Gb7EVj3JN6g2yiWat8dV/P0GOTNUYpStjt3kWb//8k1XhiGOHsc87giDI0fU9arnYVW6AAT2xpnheYw6MppaFU1SgtsrZzbVQgFmf85tMzchYmFaISAXCkR0Qn04nLl5emzdCQNHrHkuCJzJnC4ZplbSdXZyG3HroLNyXvwXUGaGrX6f44eDBf+Yt+YpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYsQjhNOV5JORLWam4ewF4CYp7U3YuXxs3DVU7OThZM=;
 b=ruYkpnqpRs9/Y57/RTwjSwIYNghdGJYyA1h4u9iDKoo3ZEY1E94iyl1MrW5AgXNzxgscIvS3Q/6u4WyhWg65nmSja70q7201aaVrI81Ray9emNcwsuQoMu6WMatBRdwVQJa41SCbb/I2o52ffxytpN79V8YwA1UFEmQtXi9SfHo/7D9fQODyCeteFOMTysGM8tGKRwhL3ByPteVVfE80hXTbzuXAJ2H7kombM2aMOmsEMUWjvwP2kZ0yoLpQqW5TvppNmRK8uu9J3aSLawPWa5XZKoZS6CUgbOAICZNBXyujcq7KoEREODtetlIQni83ZNFhyXULoNea/MAe5+44MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 03:49:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 03:49:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 12:49:22 +0900
Message-Id: <DBWQMZTNB10Y.1UHW7HJWN1LYD@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] rust: alloc: kbox: implement PageOwner for VBox
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-6-dakr@kernel.org>
In-Reply-To: <20250806205044.85085-6-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da4cfc2-1208-4180-8d24-08ddd62e91ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q29naG43U0s5VW9kWkUxVHBJaVg3TnMwVm9IZXRBRDFGeU5mRjV1Rkh5bGtH?=
 =?utf-8?B?MlloWlpITVB3Q1NtWkk0dlZyUmlLd1AwUUZMZ2oxWnBsZnNhNEl3UG5KWmJ6?=
 =?utf-8?B?cHd4VkRRdVBWRWMzRUJiTmtFK3p3d05naXBXNUZESjlJejZUTkxQRVVGSmJC?=
 =?utf-8?B?T1pGZjNnNytUSTlsV1p4dmRvK0UvRXNYM0Q5Vmd3L3BaMkM3dnl2eGlXWkRy?=
 =?utf-8?B?OWRYZWd5cnVQU2FmQ1EvQmtpQng5L1gxWlJtMnMrdzZRbTR3Y0ZBSnhCSm9t?=
 =?utf-8?B?amx2N2h0Q083UXE2SGlGc3BaNUdxZy83WkJxZVB1YXFaaGdrSFZFZVB6TXBw?=
 =?utf-8?B?YnZSdE9XcHNwV3pjNXBVeTQ2U09KUnFwY1lzY3ZhMzR0SEo0eEJMR0FZdWdP?=
 =?utf-8?B?T3dUUU9Gcm1haFprZEErSnVQbk5pZlhpaDhkNVV3dUd6RjJ3NFFjM2ZnL0JH?=
 =?utf-8?B?U3Q4M1BYalRqalYvUHdiTFp6TUtIZ2lqV1FTL1kvOEhpaXpwT3B2NVU4TmtC?=
 =?utf-8?B?Y0tiWGtFZUZDbmNJS0FNWmNVUi9WeGsrc1p1blRaa241dmhLd042aFRkV1dQ?=
 =?utf-8?B?QmkzbHNaTTFmRDFBQ0NTUlpvUEtBYWczeUs0QU1kMldZMi80b3RzSjNsZkg5?=
 =?utf-8?B?RjdtSXdnZWxKYXpqaEVvakVJOFhNekdsQ1J3QmRSMVNkNzJ2cDk4NHExTzlJ?=
 =?utf-8?B?UW8yQWk2a1Z2dkovMXVQZWZyeUNsNDlST29sTmVOWlE0STE3Q3ZaV3dZK2t0?=
 =?utf-8?B?b1daajlwbHhqWVRSRllobkpOMDRXYkxCN3Q0a3dNVjcrckJPNnRlL2RpdU14?=
 =?utf-8?B?ZWNFaGNaMzVIUXB2RWpoUDFMQ0dwYmxIdTgrb1BZd2tsZVRLblVCSG44OFZL?=
 =?utf-8?B?Nk84b2JQbm1OcjVOaGI2QmdUZVRDNWlLU2RzQ1B0emZRNFZSSkMzaFRVeU8x?=
 =?utf-8?B?aE1kZmhmWDFEK0lIZklSOHF1YkNYZ0tDeVFJc0RFbFFjTEl3VWNmbzZ6REFq?=
 =?utf-8?B?TUgxaUhqZy9oeWYvQXhiakxzOTBPL21TU1VtWXBMUnQ0WlNUNmozUlVWMHk3?=
 =?utf-8?B?ZHpDT2VUSXNnNGJSWFdYUkR5KzJvSittSUY4MGkzaXA5dkNMQjVDUzRWWWhk?=
 =?utf-8?B?OWxiTlI4dXVjZXZILzY4V3I4NHB5V044R2Rubm0xNnExWU14aGtXMEp4Vkx6?=
 =?utf-8?B?aEs0RVBVdVBtZ1JwUEh6ZTRWVGRPcWMvdDJPQWE0YjFYVXFtMVFBQzJKeXNp?=
 =?utf-8?B?Qk9Kcm4xOEpndS9Ud1E4aUNwMUFVR3IwTWNkVUdtcGNrd0IxS0NKOE02RlV4?=
 =?utf-8?B?ZzRkdzRoZFJ4MXFnTUNYZ2dsSG4zTzR0ZEtlUGQvMkdyTWs2aGFFUTFhVG4v?=
 =?utf-8?B?dlRhN1NXUjhWWnQybmpuMFFISmRzelRuUGtkN2RLWU5veUFxTkxseUtlQnk4?=
 =?utf-8?B?Z1Jlem1oYVdBY0JncExNbEJPWUM1T0I3cjM2enM3SSt0eHlsT1JQV0ViVHhj?=
 =?utf-8?B?Vlcyc3dwNE5XWU9aUHFKc3hGdWcydGVscktsUWp1NGVCUjBDMGdOaTJlVFV2?=
 =?utf-8?B?aXB1dGt1T3p3TmhKNjhBdEV5K2xndVZPSVREc1NkbERlNlN4YnQwZ0l3M0xW?=
 =?utf-8?B?Tm1odHI0RVY5NVZuczN2WUVtZVdsaFl4YmljaHM4dW5hLzhHWVJpSjg0YVB5?=
 =?utf-8?B?M3ZTV1YxYTA5WHM5MC93K1RkMFpmZ3hCS3B5WkNlRkh1Q3h6OEVKRm5xdFht?=
 =?utf-8?B?QUlvOXVOejlpWHFnanc1YmdmNDl6d2c0ZVBzVjJiQ3JrRWNEM0x6RzhqM3cr?=
 =?utf-8?B?aUpPS0x0aUxnai9teUJwZ1c3Qm1iS0lkWENvNWJaOUhBczhzSmZpRDdtYTZ4?=
 =?utf-8?B?dlJDaUhnNldCeGU0N1VVQWNtd1RsMWlncFJ6a01HTWVGNEVhUDIwL0k0TXlr?=
 =?utf-8?B?SDRJNDZ3aW5CK3ZSUGFKVlVjRWdtVVBEVDd3dHJmNW05SjNNTk95T3NqT3BG?=
 =?utf-8?B?UzM0eWlFeHVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGtuWG5xUXk4Q1RFWUd6a2doUzBkbjd2a0dQaDhpS0lMN2N5REd3NkdUaUJK?=
 =?utf-8?B?dWdqbUsxYVd4VDNiSGRITGQ2Q2VSM0pqOGxnMDFtU2ZCZXZmdDFvSHZGc25k?=
 =?utf-8?B?MFhBYXNTZ3FLQkJkeVZCQ0oySFVhS0kvYUl0OFRuSW9keHA4Qnd4eVBmK0J2?=
 =?utf-8?B?Wmo4TENNUElKeGJlcUFkS0pRcDYzU2ptb2JkSk1kcmpUcUk4TkhnR1htRDdy?=
 =?utf-8?B?bWZ4ZXB5emRZYkphcTJtNzZUMFhmSmUrR2NXdllYZGpybXNWV2kyd1BUUllx?=
 =?utf-8?B?Q2RDMG80V3d0dlRQL1ljTlJJdkRVWDZOaE9KWXdDajB1RHBrWVY4NHZxUldy?=
 =?utf-8?B?bVpCVGhsSUl3MkZ1S05yOUZKZXQxSm1pZjVRMkJYY2M2aDVUZUd3a3dhT0hY?=
 =?utf-8?B?RUg5QTRUSjFIU1dVUEZna2lmMW53MkJjcUJuaFZqUk1TL0NlamlZUGxNY0Rp?=
 =?utf-8?B?b1lIampJVzdGV3Y0M2E3TTZKN3RiOWl6cGp6N1Bjd2FjMFpHb0ZPVkNQY3Fy?=
 =?utf-8?B?R2tsQzY2UFdnOHBGdnNUMHRSdmVQRDgyY1JXYXpEQ3lPWjU0aWFNdWlJWGEr?=
 =?utf-8?B?MHNPTnFEbnZUMENlYUJLbFI1dUNTZEZiL0s2SnVEZkxTeUdRb0dXTXFFb0dr?=
 =?utf-8?B?a1F3VWNZWmc0WkNrOThaOHpFc2M4WkZVNnJSTHhUUVFEeGVkYUNFZUtVdmN1?=
 =?utf-8?B?WllINCtUTmdmWU03YkRPUGNjeVM2ekx1TmhqSnVEWHlCdkVEWjVWOFl0bXJn?=
 =?utf-8?B?a3g3Tjg5Z1dpTTh6bDlzdzJTVmorSUFOZ0JDRkhqcEpYUFR6aWZUQWw4T2g3?=
 =?utf-8?B?YWNYWDFBK05KWDVGOXovUFA1ZnlsQUtOWmxvdHVwOEd1WU1JSC9WWWVkUURy?=
 =?utf-8?B?MUkyaGNLcEVmMUp2L2hyU0ZpRi9EQ2VhSXVJY3loaUdzb3ROeW9PbVlMc3R1?=
 =?utf-8?B?OWw4cFBSeDlIRjZ2V1Q2cUgxVmcyNjJWT0x4c3YrajB2MFA1TWJVeWtGQWJL?=
 =?utf-8?B?UEFSWkQyVTNnSkdCMlF1K0RGaHpCM2Y5WUxpMldFK21mN3MvZlYzbndUWld2?=
 =?utf-8?B?L0kyUi9reWFYak5LUU8vVmhVMm1PUTJ5ZSsyZm92bkdsY2Z2ejhSZVRlR0Ev?=
 =?utf-8?B?ZjB2RDBVbU1QTU1VN1BTUkE0aEtCbkFOQzZiTjVKYVlHdjNiR0pTNnBEbndI?=
 =?utf-8?B?bzY0M0UrLzd2dnNDeEZ3TFFqYVRzQzRCUmRRWUdmSTYxanZoUjZWRm8zT0I1?=
 =?utf-8?B?OHp5M2U4WEsrK2dvRXdaZE1aZk11b3lwSGpzU3g4VDFRVnNDd1hWOXRQMU1x?=
 =?utf-8?B?NjdWYUtJM01CaXE3RUxGY3BpWWExb01xTklCVDBzT0dzejFKcllxRmJKQjIy?=
 =?utf-8?B?a0hIQjJiVnRzUnBiOHc1ZEtjSmNJQTZ4QWZsWTIvN3FpZ2pkRW5nb1Nla2Y1?=
 =?utf-8?B?NDc3bXJVSjlCYVZjQllZZFJ1VTFER3EvR3pUaEE2ekFmSHV0U1Rhdk1xU3lD?=
 =?utf-8?B?OUdxc0VwVjZlbktlWDF1TzRZM2hDVWhXcytaZlF4K1VpZ0hrZlF1bUhCd1M4?=
 =?utf-8?B?dG5LUTVnRHFLcGpmK1B5bHZ2VGVuN2p3S09LRTBDa3lnMGxtcDhHV0V4WCtz?=
 =?utf-8?B?UWJ0TXEvZEdqL1M5di82eW1JeUZ5dEJVb284bFYrMUQrcVc1MWViUUJ2VzF1?=
 =?utf-8?B?QWg3UHVlK2JvOXZvVFJIN3ZBWlFnT2Z0Vnc4Z0RZNWxNL2NjU2EycnZTWFRY?=
 =?utf-8?B?bzRLRXRta0hOOEdnc3lIZlptNlVaRzZHN05ueGM2NHVUc28xcFJKaFlFZ1ZF?=
 =?utf-8?B?WTVoM0o5OTFlRjB4YkYzb1hqK0QySmVBMjlYdDliMHFES3R0SHZGUFV0OUlW?=
 =?utf-8?B?Y3JST3dQT2lsOTJOODRKL0NjU2xuNkdNdjlxcTlQVGd3MVBXNGhVRi9mbmZj?=
 =?utf-8?B?a0g2U1NVUFp1clFka0trY0E1bkVhK1RoV1M1NC9yUU1PRU1pekUvUUMrVkFZ?=
 =?utf-8?B?T3dpSjR2cDR6Z21TaHRHMldKeDgxVzZUTEdXOUV0aU9reEZ1VVJoUTA4czFq?=
 =?utf-8?B?MmFXYlhKMi9TY2ovcXo1bWU0akdDNnlpTVNESzB5M1hPWkhrMWtrUjd6c0Va?=
 =?utf-8?B?Mm1BK1lhZjRlazZRN0JadW5pcVJKWjBmWThGa1kzS1RQSEk1bFFxd1pBNXJ0?=
 =?utf-8?Q?2zY2i7/IOwJE9nX9frb+ODkGlqeUY6b9KPCJqmWxXS31?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da4cfc2-1208-4180-8d24-08ddd62e91ac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 03:49:25.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPH9d7aAO+vNzdFlf/3C2eRnkU9ufmrBz+Rixk/a9ZYBwO7Qeo7A+qvwVlVBazCiWBZxBoPvmjRopCA0zjeIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267

On Thu Aug 7, 2025 at 5:50 AM JST, Danilo Krummrich wrote:
> Implement the PageOwner trait for VBox; it allows to iterate and borrow
> the backing pages of a VBox. This, for instance, is useful in
> combination with VBox backing a scatterlist.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

