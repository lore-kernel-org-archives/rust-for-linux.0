Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB5E3469E6;
	Thu, 19 Feb 2026 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514914; cv=fail; b=ph+jtRgYVvRVeDI9WE01jkKuQsio3VfoajCGt0inTLk2GtzV3I/6vZoB6Z1V9NIOvjE1cJlIPIl+ERcH5nIhgR06y3ODpGu0PCOZLlE8sO95gzJxZjui4+VT9xPwzi1CA6adJatCbmNT93uSpBQhc3eX10zL5kDUwsR6DGno58E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514914; c=relaxed/simple;
	bh=AHf+0nj2VUzwahVk2IS+Kmp8So4wC/z2Uc04wFZrMlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-ID:Date:
	 Content-Type:MIME-Version; b=VWTVnKgNdjHT9tIuoXQ5QD2EnFcRhxz10NPrktWURyNvylG/KJfZHD8+/8BzCq64dyV3Pvy3nu3jorBfau/PRXO5Tpk/iVjsP54ClLcAX3Dm0mcXb/Nlv+eAWSJDLyi1qng8gA19l+94PhuYuyULDf9iZPbLuCJ7wiJCAgha+6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dZJRzp/0; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dZJRzp/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtPK9yNCe3XLutNUak4MQtFNtpGWeeivmz3IQDfZlHdnT+uI/K98jwogQTx3Hc9ImiywRy/s3rpw5Oq8ETtuli7ZSqSTZHErQfFDwMTK6ipjZ4vmI5pMyDK/DOurX+T92lp6zy6UsgUp8Lz/8sDBfnCQYJfkbXMNe7bneSgXhsPDi24shpuUGn1twY3KnTrM2x6i3IEczNvs97upVahIxcyvlI9A09+WUH+c2JUIy3cW6kwfJyyKWr4qt8PXuoAonn8faaFnYLzsi8PZ+ijnw1q/1s6lhnUXGgnvWjriDNFUwjBsJIJi9kpyzWQtBNnaYMjwYsVJgvgfIuv1cOpEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHf+0nj2VUzwahVk2IS+Kmp8So4wC/z2Uc04wFZrMlo=;
 b=a1OPvOtNFYKRBafKrnFy8MyZDaNR6CPtpn3RKac83Z2YcdD9eZ61MKmjKH/UEZtNPA+x/W0cvb+nyaCglmntUfqaOd3l5M5Pl01SYeGZsSQpweNoUAPKB3G1Ypho5IlXWJQgrwfc53/k2FQmGyrj/dxmTbjW3m2bANH8QQSIG8/pksQsQO8oq72qbg8rUurtYe0VDXk2uLOE2UalcQDvPko5roTB1xaoT13GSQzELImNOhJXve+e/0FqWtA1KdN3hkkNTvTGzaDsjfaORgG+9zGGn4qzPrAG8FvBDoMU4zFBWKeSOv/Xdq0og6mV8wBeuGYAkkz3A5MWv5L0N2/+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHf+0nj2VUzwahVk2IS+Kmp8So4wC/z2Uc04wFZrMlo=;
 b=dZJRzp/0BS5tjxh3b/0ZK3PG3rIdxVdnUM5Ws7TglgpCitmvk0FD3pZ54DSqoeFiXb1IKbCDS9+tuJ1yPDgxDMp+Ui5P2TvcCjwezj40ArlzRCMzagb/pfyqXKiCRZURZOrg38etVzIQu+ynLFLYRBfPpR6iH0x5yA5JHH/ewmcPHDX4WVqBRsO+1HQtBXIG5uJRMs4kyjFzmJRnreH5maSz6sS7aOEVQEw3ICbAVn1VSy+7NGO/vme7w8FfF3PcZfykiDObc6r7Nns0uqkTn3DO6Jxo77I4yNCiRUhirKzCh/2j9JMeVUzUi/c96DkfUIK0gHWmyAQVE1XjxqLgtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:28:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:28:09 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C linked lists
In-Reply-To: <DGIUM0N4QQWD.1IH8DWPVIFXTF@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com> <20260218205507.689429-6-joelagnelf@nvidia.com> <DGIUM0N4QQWD.1IH8DWPVIFXTF@kernel.org>
Message-ID: <a40df0fe4382dfc47921830348d7069e@nvidia.com>
Date: Thu, 19 Feb 2026 10:28:08 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:208:32f::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dfcd3c-aab5-45e0-1880-08de6fcb7cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ui9ZN3dDMTJxdVBxbklKSTVhRVViMW5wakRmTEloblNqeUNjcC9ac0E1MnVQ?=
 =?utf-8?B?dHlIb0NxWU5hbFhmRnNVOWI5M0VoamhEUnlZd3p4cmZSV0ZOUHRsa0ZZNk9O?=
 =?utf-8?B?MmlVME5tdmF6WG1vVVg5eVN5dGpZeE9iK0hwcTF2cCt4MGVZUVVyVjdXd0xI?=
 =?utf-8?B?MVR6UFJvNmlrSklsbE9VUjhQNXRMNFFYWmhueTQreVFpTWpzU0lWME5JZTEr?=
 =?utf-8?B?K3dMVXo4UUM0V2k0N1pWVmdsT2FJaWFFRWYxNm9uWkdHSkhURTNaQ010aWZ4?=
 =?utf-8?B?ZXBxc0pRUnlwcnpJT1dUZDM4RTJRV0QzKzNpQWtWUDZLVW1xd3RLZExiSkd3?=
 =?utf-8?B?RE1tdlFRakxYbEVDVnFmR1JObGVPdjEzQll0Mi9ZTGlkTmtjam12cVBtWHNK?=
 =?utf-8?B?d3pHeVl2RjhqMU05dXBPMjZPbzFlRWN4Mk5Ibm80d1RYV1kvbU1zUmZxdjdj?=
 =?utf-8?B?VjNvT01Ub3ZQaThxNUVwdnRCTUpDRXpnV0RJY1NMMlliY0JFaU16Vk1YWmJt?=
 =?utf-8?B?aWk2d2hXQktIeTVzSGpPVUFaaWMzdldBNWkyZDdpVld6TDEzU2EweW02emll?=
 =?utf-8?B?VE5kallQWnRJZi9IOElzWjIyREtueS8xcGErbUVtMC9kbktxUWthRGxWcUNF?=
 =?utf-8?B?RXVGaEJRYm9kUlM2SGNxRXlNWER5L3U0VmFDMjUyYjU1TkozeWhCcmw1dUQ1?=
 =?utf-8?B?Uk8wNXVaYWJOcDF6R2czOEN6ZDBGVGVRUVJvWmxNa2NzcEtmYVhDNnYyTHBu?=
 =?utf-8?B?WDMxK002TnhCaFlUOG5yQTRKMllVZUx1ZnpUN2NVZE81SzhBNWQ2Uy9SOVRw?=
 =?utf-8?B?U2J2dURVa0tjZTRtYjlUMktpU1B2NXZGMUJKNk5ZMEVtcWYvTGhUTTAwbmNP?=
 =?utf-8?B?cE8wMGdmanA3VzlHaHlKQW1LQkhuQXgyV0ZqS3RZaGN4eGFqbXFzZ2JoRHdy?=
 =?utf-8?B?cmJPNFRGWTJGa25LQjAxbnV4aWZ0SVc0TUlrWGoxY1VEeHZJUG9qTXZ1S09u?=
 =?utf-8?B?MFBCU2tEcDg2ZVBhTU5iK2JUWWVSZmJuRlRmeTVsZTBjejFZSkUrUWcrMkIw?=
 =?utf-8?B?N1M4K3JPbmxGejBxc3gwTlJOU0Q5N1pickQxM0JvZTBKV0pTc3l0V3h1cHFO?=
 =?utf-8?B?SXArYzR1VXVUNGljbHNsRWkwbWJna1NRcXVHeS8xMFp6ZHJGV1k2SkdObjBQ?=
 =?utf-8?B?V2VtRllKOVpPdlRMWVZMUDRqQUdQY1RBMjNXcDVQMDhkcHB1aW00WFpZSjhP?=
 =?utf-8?B?aWYra1VITmtMUGl5M0dzSVZKazN4dlh6bWhQbDhIZjdMTVNvdEdCRzk1MXVp?=
 =?utf-8?B?UnRCZm00WFVmZ2ZWenZHMXB0ZGJoZ0VwcFpMNXNyalViUzk1cEI4UFp1OURi?=
 =?utf-8?B?WEtQMVlsd2VOYklPcUJ1YkJZSnJDQk4zZWV5U0FFNHJHZHJ6SGIzdHpLVEdn?=
 =?utf-8?B?emltNGRESlh4RmtYWDNta3RuYm92Mk5MQkhZZGRnbWdYSkxUNkNHL1FIYllx?=
 =?utf-8?B?cHppU2V5OVBxWWd5VFBJNnFUSWxIUE9oRXZYMjVqSm1FV0VpY1FjNzlvTlVZ?=
 =?utf-8?B?aGd5Ykl0MVk4SGlIeDJVVUVCOExoT3ZEMHQzQ3JqajRlYUZ1ZFE4MmZ3Z0RQ?=
 =?utf-8?B?WTROUHdibDkwRDNsdFdjMVV1VEFkaTJTSnhOVzlVOEVFTUxjdkRuRlFEYndG?=
 =?utf-8?B?MWNVaHRscSs2TXdpWHk2N3hPVWRYUmFpVnNkN1llVUdxWGZpNnh6bUhrOW5Y?=
 =?utf-8?B?TVROb2NkUDJseHI3U3VFRElFc0NDa0F3K2VYZWxrV1dWL0xDTTlUNGcxN1Qz?=
 =?utf-8?B?S2pjTENoUTZHUFBXdnpTY1Q0Mzh4UnhOQ240SzAyVForODhsMktqNi84VUlo?=
 =?utf-8?B?dW5SYjdZcnVRTm4reGtuMzdIbmgwRGdWNFB1MEVQZlJZZWNsZllPS3ZoZDg4?=
 =?utf-8?B?a3VzYTFNZE9OYlJaTFk1SS9lTjdDVkZWbkhiSkM1OFpMVXVvVFJoNmhCa1RW?=
 =?utf-8?B?Zk5zVi85NzBoNm1jaU9jazFlbnhocFNhb1p5b3BjdEdrZzZONXQ2SEg5Y3lG?=
 =?utf-8?B?bGR2Yk9zUHk5OFphbXpXTG93dXJ3SXhBcWlNN2k2dTY0dXNkTjROdlBhS3Bv?=
 =?utf-8?Q?PrQ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnZDMi83b3hpU2pObkpEbzV3aERjZ3M1ZG1qYUZ6a05sTXdWdWt6KzNlckhG?=
 =?utf-8?B?NkRTM1EyK0EyTlhtVnZicmRUNDZHRXFSNXBiZUZxcFltSUVTSE5GZkNyTzh6?=
 =?utf-8?B?b20yRGJQeEs0ZVdUcENqTVREV3hMeURCc0ZhUlhnN3RnUStNR2txZSs5dlRv?=
 =?utf-8?B?Tk1Ta25GZGRJQmlqNDJHaWFJb0hDNWF6bXVsMC8rczd5YUgra2tRNVRLbk45?=
 =?utf-8?B?QUEzSEc2UTV6TEdDdDNkODZLdWNsSXVhajh3L1h5Q0pseTVzNEI5MmhSWHZn?=
 =?utf-8?B?M1NXNjBTMklLeTRiZUxtR3hENHdEVnJ4M1Y3NngxVTQ0bTBPTUhMNTc2Uk9X?=
 =?utf-8?B?bjBMcFRpbThia0s2a0ZzVEJHZmJLTkhzcGZOSGR0d1pvSEd0TXprZzY3SWMx?=
 =?utf-8?B?S2gzQWFkd0lwU21RVGdLTFErKzNqRUlYOU9yaDg0TElVYkhoNkpIT0VSVlpL?=
 =?utf-8?B?TkZvTmc0bTFXKzVndDBMY0lOemwrZnlpaFVOMHZOalN0bEY0YmNOOExXY2lJ?=
 =?utf-8?B?MnNVZnBkdFFuU1IrQ1FtMDlkL2RITjNxK1FzSVl2WGRFNmRTVEJPOGVWL1ZS?=
 =?utf-8?B?R0VTMkNaV05rK3dFSUsyR2Uzdkt4L0JuOGJuZWE3VWo5WVZtcy9vY01lWHYw?=
 =?utf-8?B?OWo3bk1kUTl1Ykg0VFRkZVdZZ1I2dW8ra2huNXh0ZHN5bnRibzhTbllraFBn?=
 =?utf-8?B?QmdkL1dWSXoyVHg2OWtnRkdlYTJORzRHeWdFRk81SDdVR3JETTFDVVBKbmFU?=
 =?utf-8?B?RFV4U1BMelh3bDJZMm83V2pyTVppN1pNcmdmTXhKOU9ERFE4bmFjUlRmZUQy?=
 =?utf-8?B?S0ppUE1lUlJrNVBWTlJib0hiMGN6b2RnRnpMWXNHZnIwTWU1NnVGNjRRZXBo?=
 =?utf-8?B?ODU2TEIxR08vY2VNa1BBR3BvY1N3ZFdSRnBGRjZVckE1ejUzb2dKUHlNWXZk?=
 =?utf-8?B?SSt6UElCc3RubEM3RVowU1pvOUhVNDlGNmd5SE9KOHhsOFIvbFRJRkt0NWxn?=
 =?utf-8?B?cmsvbEhtUGZ0Y0NNdGdCYy9xQmpTTjlES2VxeGplK2VRdmh6bkVDdjlGRFlY?=
 =?utf-8?B?MEtkVitpMzN2eS9JNjlQTWlwUjVkQWdxb2ZVZXFjbWYybzZlOHRWVDQ0THh3?=
 =?utf-8?B?RnNWU0k2YTRXQlcyMTBWT01HaTBLMW5lNUFEamxScFk2d3dmdUxUTndGTzQw?=
 =?utf-8?B?U2t1bnEwY0k1Yll2eVBjNnhINU83OWxSakREZTFvdDhkNlJqdE1jQXF4UXZv?=
 =?utf-8?B?ZmlHeHluUUFwdUx0SzNnUDlDbXI5Qmk2bTcvMlJlaUxmTjRqMzROdDUwK2pX?=
 =?utf-8?B?ZFdhenAybFpkVS9aVGNsbjd2TitZK0FueUR5UUFyRmZMckRtNjZSYVVSRVJq?=
 =?utf-8?B?b1pTb2R0TlhwUGpaZ2xLOWtMc1E0Y1JGakJGT0Y4WUNFbC8xNlFOWnRPejkr?=
 =?utf-8?B?eFpESUxudTVGNE9kdlNCcEZ5TGVPTTAvVjcveHFCR1ozdmxSVmJaMXEyQ0RB?=
 =?utf-8?B?QkkyRnhsZjhiL295TEdLMmlNbmVuQ05JdkZQZnI4NytYVHhSZlVLUk5ITkZI?=
 =?utf-8?B?dDliNG1yK2lkUEx3ZUNJeUNLRVA2VitRb1U0Q2ZqZmdSaEI4ajBIRm8yTHkz?=
 =?utf-8?B?YjBVVFdjSzc2d3l3eC9UQTk3N1lHOFo4cnNXeUYwTzFDVlBXTTdIc2liRno5?=
 =?utf-8?B?UVdGQnpaTkU0YjM4Z3pDcEFQOXZpcWh1c3VESUo5VUtWSk5QZmtaVk5LVkxh?=
 =?utf-8?B?NUlEL2hyRU1rM25YS0RPYTZmWWc5djNHMkxUc0k0RXFuZ1M1VEJreGdBTkxv?=
 =?utf-8?B?YnE0cVk1SnlKK1pyNkNZaFFjUGJTMkhEOHJkUkFpRzVxWjBUU255MnduZGNi?=
 =?utf-8?B?YzVON0xYem1PbUNrVTNrZU1VVkp4VzVrdTlYVTlMQTNoVldSOXhVY1JnNlpp?=
 =?utf-8?B?eWxFRlpzbUJMYmdTbzdoQlE4bjg5ZlRVeEIvZ0p4c1RsN28wb2h4YWhNQk11?=
 =?utf-8?B?ZWpXU2pma2s4Y2E3bnh5Vnp6dkV5dFdDM00yaWpjZmdBOE5PKytkWEl1andL?=
 =?utf-8?B?V1BYd3FKK1FYMnA0a01oM25adTd2TjMvRmpwVEl6Sll6elEyWEt1L3RBV0k0?=
 =?utf-8?B?V2YzRlBIVzAwVHVoVWNaaW9XOG05RkhWUXkvL21qUkV4WURLeWQ5VW05L2lM?=
 =?utf-8?B?YllaLzlLdWtUUEU5eU1YSC9nSE9xNUY5T0VMVURVUjM2V0tRSzlwTWZJWGd1?=
 =?utf-8?B?eHR2OTZwZERYMTQ1d3ZVYjV1aVNyNS9QY2lEb2lSK0FXZWRNWEYzUFpwdXZu?=
 =?utf-8?B?NzQ2V2pRY2pkRnpFMHNHVzhLRmVxTTJwUTl0WCsyaVpRb0swN2tiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dfcd3c-aab5-45e0-1880-08de6fcb7cc7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:28:09.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opFSDxmiNIjJzhKBXSOfXXI5UTPqdz2Y6nP+noqy+CFrlnJHg7+Fpz0h3nfd+Le5p4oX2AiwLdGdDmarDX3tJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989

On Thu, Feb 19, 2026 at 10:58:42AM +0100, Danilo Krummrich wrote:
> For reference: https://lore.kernel.org/rust-for-linux/DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com/

Thanks for the pointer. I've addressed Alex's v9 review comments as
well. I'll reply to that thread separately with the details.

Joel
