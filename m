Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F51E32A2
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764336930; cv=fail; b=uAL9o+b9a3ncewDH75sIwFj+ljtBJORNFuapFSGMNqQpPFbT7IIu0v/4huPD+u8WKrXXT6ME4TS7MpC3rXC3kUiV9pFyRnhojXBQRGYMijoJltHU8yt5AToWCVOs3iJGUg0az4Wo99Kd8WHPfNaO4HuLIJArAEGhVP49JMPoOHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764336930; c=relaxed/simple;
	bh=z1YqMgEk6s2Uy5TzM7H7rvgOMlZ8pWyh1TbHH9UJ7ic=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=csOdTxRbpnpBBMRhBe4XJPiCZfD/9rPYff3Fl6lC5k6RLgd6Q89nzXeGqXULAsFIE128cd8EITtqaBkk9CJf/xVvt2wCCYi3bN37MH0K/wKyXM9Y1WPrYNa6QsccVvmmdBnF9ZDz3OPyTndBiRviuYCryQmiv8HaoUOLlKI7dgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VVZVsAhp; arc=fail smtp.client-ip=40.93.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VVZVsAhp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1/gLmsmG+fU61OX9T3gfpExHfyL0vpqJcoEv2Rfa1U1azqn//GXiUXV5rqdyvsu0GH8kSa7aPHyYkDvwGUtLkyBu5X7NGKaLhqKbS9JKJVXJ1hPWu2UEyWMrQq7kVK5m9yssW+OBNsLtbxf+Zm23Zu5WhzOYOwqFPEqxqCrAf5ctnHlhPdzVr0QkB7w8Uq5VX3HHCuwqRLsJVkNEBdosebaYZl+hcw2o0uMChUQt72NFUMHmdM8xK85hbvPNlxZ7/V4xZ7kFUyNGRjvEMR8ylIZwcm1cr4qk8/qri8HJPo+kcE8TiFRazFVyoHKj1g+L6M1K4J9BOnwyGkrxqGIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUiPBfK0MwnjsACSKtX8DQVOHVIo3v3E8Kg7skhvLig=;
 b=TWRZoZ3+yW6wYF8KH9LspyvanGlTU97Ua2yxw35d/Q8dAzRjFPvMWcLcq4QLQgv0eQvUSkACj1vwWUkHY9F39lD0gAuyEx6F8bktoFMzw3OcRliuIG4vElvpcqF2MpuzgEPDptAQ8sbU4Y/dR4lar6llu2lW4XsHFU7OUShqDavs7RzGGdiHfiBI8U0T4YaNNOoHCPx926oUBPnPDNjvXkLr0raIjXnUxsLAxMRIz/S3runXq58MIKIruTOfVC5YF04IvGuUh+Zk6RlAeQBwRuiBCJ+hgnrWw/XiBcZZVsPTTQvI/S+ZBoTWtjaiSy3+v7gp7QmO9dZpQTpJ37cDAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUiPBfK0MwnjsACSKtX8DQVOHVIo3v3E8Kg7skhvLig=;
 b=VVZVsAhpFmJpFDInyY5CKI3j8hgSW0qCFlYJ25b5XjvYDVtSMsEk8b2l8Fp9AzWxTDnHsPXFd8xpu1srKBg+8+dwNXI0R1lVtE+QBg8Ihfh5jGaSzBbp4sUVpJff0XmaIwYD7dRKZqtBCzEMm2FYSctySGkzNHCvuYAIuUuvSBEGbxU0pIe+7KJVYLTTJIhWmxmpvhC54lng55Kybt19XTngcqNFvUsbcalleqaSVKaLKQrPKPEzUy3UsgBfy9Y7DVzdPOSmeuTVrt45irKZHDdapZNxiCPadMa7+Gwf2m099zRgszWpZIbu+JwpUNmC3Jsp2DkLNtbgwHvrfkaemw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPFA42F4F89B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 13:34:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 13:34:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 22:34:09 +0900
Message-Id: <DEKD7RA5SYJ1.7RRBLFZ09X8W@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Brendan Shephard" <bshephar@bne-home.net>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, <dakr@kernel.org>, <airlied@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aShM9CAyRPe2gYpK@fedora>
 <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com> <aShdutWrmU2q7gUT@fedora>
 <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
 <CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com>
 <aSkzK4QDU6pN2GMS@fedora> <DEK4NFX9KS3U.38DNRG7ZMSZQJ@nvidia.com>
 <CAH5fLggsmNd=3ezgK5A1k3YnO6ZHbJRhb0jsO0sR+ERChrewUw@mail.gmail.com>
In-Reply-To: <CAH5fLggsmNd=3ezgK5A1k3YnO6ZHbJRhb0jsO0sR+ERChrewUw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efdcf44-863f-4a59-3ab6-08de2e82d180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmhna1ZVbGVzbjZqWUhjNGt0UVVrbFF5TytzZEJCZUdvbENPWWtjclN2UnE1?=
 =?utf-8?B?Rk9HN2ljWjFHOVllTVR3RFRRQlNaaDRxMGlnbGlta0FmeEI3eXZXTzNMSjd1?=
 =?utf-8?B?bEJoZXFvNXB5c0Q2TnNkem1BUUFWSWNOMFpac3ZWYXFKcTQ4RjJIblJSdmZR?=
 =?utf-8?B?ekROR2lsY2ZhTTAreDVXNzE1dWhudXB4SkhaRm1XdExONEp3dXQ4VGRFQVdn?=
 =?utf-8?B?SXpEZzEvOFZjZFFiQSt1a0ZjMHF1UDFFZGpNNEYrSENSMmpZWmYzYVpCakJS?=
 =?utf-8?B?MXE1MmFuU1VZa3JaYTBJZ2duQXQyRlZmTWdqS1Q4Z2FTWlI3UHRUaFdZVTIv?=
 =?utf-8?B?M00yWUFkL1JBUDZkVk9RaWRnRlcxc3lGbEtNTlFGdCtuVk1hbG9UTXl0WjRr?=
 =?utf-8?B?VHZPOHdEOXR3T1Q4SGZ4VExCTk45bFltUHpBSEtFcmNWUXlEZHB5NEdGZEFz?=
 =?utf-8?B?emZEalN4QjcwN1AycFovVUY3WndOQ3B0K0VVNGlxenM4Zlo4dVUvVEFjV1VB?=
 =?utf-8?B?a1owWExYcDlJUDVLV2REQm1obTd5NXljU1FUeWsvTHl4K0NiR0FUdEhWeXZ5?=
 =?utf-8?B?UkE5Wk8zT0M5WTcrUmdFQVZsMGxDR05NbDdkRkdtYithRlM2KzQ4cWlVTDkr?=
 =?utf-8?B?ZnFrMVdSakErOXFWYVhaK2Z3aVZZR1FhYTYwSVhuQ0xUTEZlM2xwZTdrRTNi?=
 =?utf-8?B?dTBWR28wOVlKR0FzaXoyRVQvWGhKalVsaDBwc3hVLzRPSDVITVRuQmFiRndk?=
 =?utf-8?B?a3U2dGxvS3NybjlDTDJaYVMxUXEyU010VWZabkRPNUhBa2dtMWU4YURJYksv?=
 =?utf-8?B?dXBXeUo2OFZsbE04NE1NT09YMnBIelBVRjNYdWJIajF1Z01oMVpJbisrRGVP?=
 =?utf-8?B?WktRQndCVXVOblhlUXdIRExxMUloajBVdFR2M2cyS1RTbHlxeG5acEtjY1Yw?=
 =?utf-8?B?eE9rMEhPa09IVjhiaUIyVXpWcnlqekVRV1h5T09wUU1qeStLaTJtd0lrcmcw?=
 =?utf-8?B?ZlJNS2FvUGorYzdlNGgzblh6VEF2cW5PNG1CTmZnRDd5RHVYUmQ0Z2pqYldY?=
 =?utf-8?B?UmNPS01MRXlYeFIrS0lncUR2U25KcXlZK1ZjNVAycVgrWTBNbEkxNWxCSktm?=
 =?utf-8?B?RHdZWDhMQ0tXdlVGYXdPei9RVlk1T3JMY3lkMjFmb0Q5eG94d0YwT3FoWmNq?=
 =?utf-8?B?YmhPcllMQVBEVmlXdWJEMyt5SkU0ZlRVWG1RMVhITEFlMTg5SlZkZ3k4Yzds?=
 =?utf-8?B?UHdVSStjRWxwS3U4UHhSd29IcWN5WG9zTTVhUjJBdUhNVmtVTk5YOElaakxP?=
 =?utf-8?B?VVZiZ0Y4aXlocHdGL2hmTmlqK3hZRHhuNDd1LzdSUDRiV044N0pLRzZHNTJK?=
 =?utf-8?B?VzRoQk14dUlRQUdNUmZZZjl0dlZtbG5BOEw1ellDWEpERWxNbWcvclJCeGx3?=
 =?utf-8?B?MmtCdWdDNkFsczdoMTY4WnJYNHYvUnQxVEZmS2JJODlEUFVLSWlUdG8xVTlk?=
 =?utf-8?B?Qm0zZTJpVjgwRTdVSllJZjRpZDdnWXpRSVZ0QWpTK3dxeWJJZkI5RmRGME9i?=
 =?utf-8?B?eitsWThrbjRhL2NhSy9hYU9yS0h5UlVMQjhvSUVHR0VHNExUY29xQkw1REJu?=
 =?utf-8?B?NWxwUm51TlBLVHRYZWhOWXh5WC9FYU4wcnNXTW1NQXF6aGFTM2tqa2M3RVpp?=
 =?utf-8?B?WVJIWG1UN3A1c2R3MDJCZUhjS0lWcnFFRDF4ZzFIOUJkZlJqSVNqaEZGbUZt?=
 =?utf-8?B?OWdmQW85K0dSTkxhNjVWemxPZ21DRHVzeFltRWdtM1BMdFZXUUwvcWFheEp3?=
 =?utf-8?B?ZmYydGlKZVdSR29PN1ZSUGIrNWRxckNZajFKYm4rVEx1WDlqOGlKZ2JGWEtB?=
 =?utf-8?B?NzZMTW9qeTdKd3ZKT1Vhdm44V0Z1TElrSDB3T2EvQnBjOUZsclZnaXFSQ1l2?=
 =?utf-8?Q?D0f7vhttnbMtBbiWAi94UdO/BqI4gIgD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2tndGJ2ZTFITFpYbFNiVUZ2ODJNVEdtdC9wNGMxcWN1UDJIVEhOVHQyWVVy?=
 =?utf-8?B?NFFmSURMSFIrSjJJaGVoSFgxM3NwYVR5UitjWTFzZHdDemFYYnEvTE5DL2o0?=
 =?utf-8?B?akxNM1crbWZHT1BYekpmTGd5Mys3bFJzc3piV0NFVE0rUEE4K2JhTzZSN0M3?=
 =?utf-8?B?YzhDSFdSUGxramFXb3hGdWxobVd2cXRtc3JyTE1mY0J6TG1CdVFhLzhWa2c4?=
 =?utf-8?B?UFhHaTUvS2k4RktQdEE5dWllckVrL3FMKzdWWVV4OGtQbCtLRVN1cWt6MTlv?=
 =?utf-8?B?MHZpbHFxVmZZcEhYMHM1aWE0Rktpek5RV2RFbmozZmszdTI3aWcwdnhkejlG?=
 =?utf-8?B?NDl6VmhoczM2by9zQlh4VkExdk9TcUpSK1pvZUZCU1loL1ZPbnViMHM1M3NE?=
 =?utf-8?B?ZHZlMFg2WXQ1Y2RqWWwyR2g5elVCZzh2VDV0NmJ6L29pS0FQTnhiNUY5cDNP?=
 =?utf-8?B?MUtNd0xKU1ZCMzcvQmJzVXNRTDZsT1hib29vc0h5QzlOaFZ1ZUR5ZnlVbVFN?=
 =?utf-8?B?RW9DTURGR0ZYYlUrQWUyZVlTNEIzbUVhaGprc1BFTjRrNG5tQmlHK1VQaUdS?=
 =?utf-8?B?UnliUHJPWG80RUtsckk2L09OY2VIakt2dG1QYUlKU3V0SCtCYlU4MnoyYkc0?=
 =?utf-8?B?dXQvVm9BTWZTajJjM21xWUFUanVhZjhSMlhmOXVPZmR3NkNGWVlBUmtubDQ3?=
 =?utf-8?B?end0eFRidm9GU3IwNlFoNFdCUktqdFR3WDRjRVUveHQyT3o0cUM0aGYrM29H?=
 =?utf-8?B?SGVzOTJIb1BLTTNrSmRvWmROM1orbW1WQm55ZnNjdURnT3MyREdBTkhxMmE3?=
 =?utf-8?B?aWNjeFV3MVArbHIzZGEyT0ZYYlNTWS9kcTk0NXk2NGplVWoxdnQ1Ukp2SHRQ?=
 =?utf-8?B?STFPR2NISHBuM1VvZk14UXJkVXNzOStCdi91dVBpT2gvUGxZclpWTXJVQVVG?=
 =?utf-8?B?L1R3SDQxWERtVldqVmxIeXdJanRlaEpWWXFSc0wxSkcxc0JkWWtBb1JiaWdF?=
 =?utf-8?B?eGtuNWNheWdHMlREUnVyQ1hzMnRGcTN1NmhFWHE1WisxalVvUTdpNGVaWHZK?=
 =?utf-8?B?eTBSM1FRUE9JaWdwMFdTTkJDUktVd0dub3JjRHAxUWk5RytxMUdpZjdlaHJQ?=
 =?utf-8?B?b05NdEVJZkVmWWxnK20rUStiVDBFekV4MlR2TjIvMzQzZllubS81SGYvelR2?=
 =?utf-8?B?T2RtMmNnREROVjJ6anY5SnI1UGRsVDBMbEs2UzZWLzlvMlBjTE5oWmVqSXhT?=
 =?utf-8?B?YXlNenlTaFhlV3BPUVpsVENGenZxWkFJTDF4ek51YVFLM0VGMnRCNUIxRTYw?=
 =?utf-8?B?UURBMFhrM3JjTFBwSDhaUHFLbDZSMDljd1R4SWwwSGR4Y0Vma2dwV3hnZWRM?=
 =?utf-8?B?eWYyVlpPdGdVZHV5RHpMbDBXWUVXRHNFTmQxUHZwV1QzTXBaQ25Ra2w4Y3Fx?=
 =?utf-8?B?cU0yRy9MTW83SjU1NGExSUxZZFVOQTNxVkRlYnkxaFlyL0N1Z0liaEZvdHkw?=
 =?utf-8?B?RlpuRlhrQlh3K1cvcXplYmV3ODA4djZseXhYOGZHN0JBVVBqbUlkUjNnS3lY?=
 =?utf-8?B?NmQzQ1lhQlV4YmpubTlSSlZZSmluRXI3Qy9SUHVXU3gyWSsvd0JPd1lUdnRZ?=
 =?utf-8?B?UzNKRmh3K3RnVEZqQ21Oc1V0UWhZNzdoNG9tWElOOVZZUWlHUHNobC8vQ29u?=
 =?utf-8?B?U1R0eitRR3BkOFAzdnF0T09rVit0NDR2emkyeHFrVWtZSTZhemtYbHFwdGdV?=
 =?utf-8?B?NFM2anpnWUlhWnlUUlVWc0hjcWZRMHJNMUhBTERpVUZ3QlpXcS9uQXZ4VzNY?=
 =?utf-8?B?MmtaKzVKVVNtWjR3ZlVVTjFlY213VGhybnN5K0swMmt1QllNSzM3OVIvVmdH?=
 =?utf-8?B?VXBXYmpuYnFsUjFMZjNhQUx4RTlMSS80bVhGUHQ1ZkEwSVM1dERPVHd0QlZu?=
 =?utf-8?B?VmYxbldjK0J5ZEZEVlFKN0xSbXZwVUNHRWtaTlg5dkkvMit0N0hiNUkxSjRI?=
 =?utf-8?B?RFgxUUlhZ2YzRzNWS29VNGNCYVRuRW0xclZsc0F0RjkxSVRIS1JmQkFmRDN3?=
 =?utf-8?B?WUx3MGNCejJhZDRXN1hWdEpPRFhLUzZGR0xQN2FEelVydzZHZW1KSVBZTnIr?=
 =?utf-8?B?NldYVTdFNFRMcVlVblJyKzZlMmxaQkdNcEg4aGZnMUtnb1BVMjdtckMwdXhk?=
 =?utf-8?Q?tdVk61UVffN9fucrwqgnViPz6XJ4Hpk05UE5SRTXd7i2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efdcf44-863f-4a59-3ab6-08de2e82d180
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:34:13.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ5t4moRjHfPjcDj8U85y2OuXF9hblsgk9NFEWEWT0kFYVX8mt9+YQXiYL/PRRb4rzK85DcIcHs3TRLjHjz8mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B

On Fri Nov 28, 2025 at 6:09 PM JST, Alice Ryhl wrote:
> On Fri, Nov 28, 2025 at 7:51=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Fri Nov 28, 2025 at 2:29 PM JST, Brendan Shephard wrote:
>> > On Fri, Nov 28, 2025 at 03:12:13AM +0100, Miguel Ojeda wrote:
>> >> On Fri, Nov 28, 2025 at 1:29=E2=80=AFAM Alexandre Courbot <acourbot@n=
vidia.com> wrote:
>> >> >
>> >> > Ah, indeed. In that case, can we make the if arms symmetric:
>> >> >
>> >> >     if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
>> >> >         Some(sum & PAGE_MASK);
>> >> >     } else {
>> >> >         None
>> >> >     }
>> >>
>> >> Early return style makes the happy path less indented and is more
>> >> consistent with the C side. However, here the happy case would be the
>> >> indented case, so `let else` would be better:
>> >>
>> >>     let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) else {
>> >>         return None;
>> >>     };
>> >>
>> >>     Some(sum & PAGE_MASK)
>> >>
>> >> Cheers,
>> >> Miguel
>> >>
>> >
>> > A wildcard entrant to this conversation. We could do a match instead i=
f
>> > you all might prefer that?
>> >
>> > match addr.checked_add(PAGE_SIZE - 1) {
>> >   Some(v) =3D> Some(v & PAGE_MASK),
>> >   None =3D> None,
>> > }
>>
>> Clippy will likely suggest to turn this into an `if { } else { }`, which
>> puts us back to where we come from. Miguel's suggestion of returning
>> early in the failure path looks good to me as well.
>
> How about using the question mark operator?
>
> Some(addr.checked_add(PAGE_SIZE - 1)? & PAGE_MASK)

That's unfortunately not usable yet in const contexts:

    error: `Try` is not yet stable as a const trait
      --> ../rust/kernel/page.rs:35:10
      |
    35 |     Some(addr.checked_add(PAGE_SIZE - 1)? & PAGE_MASK)
      |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      |
    help: add `#![feature(const_try)]` to the crate attributes to enable

