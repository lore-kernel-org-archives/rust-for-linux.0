Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011071.outbound.protection.outlook.com [40.93.194.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D83A0B1C;
	Tue, 24 Feb 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942952; cv=fail; b=pCxsHYDwinfLYRci0ljonBVKyw1rvbSdEWdIbcJTUXvURZw3yU5Tn4zpd/ZGNlRFDX7bInyuKbZH6YNJmivUU6xkStpPEh8u7BS9LcqnncVtgh2gTZ7pwymgzxPfA5TE9BFLgTOmXiGbB4wKMAORuJTxA5eph1dYBfO1lCISaTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942952; c=relaxed/simple;
	bh=Rx5To5YtmxhdVoxcODIf2BvjtE2cU2ARwvFDZrH6WNc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ko7U/URlLoHvFU0rPTfWMF6lKeQeGD5XdwENKRNuHVg+BO9SfKSB4M+KwQ07g/6Z3kzVjx8eQDfCszaXl7TobqXcizRvR66DTisQkXlK/FWI9A5QYx3lm6cyai3F8Eei5oTCKMqAbGl+LCxQU5Zf3XmA/BYA1wfNxHlxjFSikA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XOfNOr8+; arc=fail smtp.client-ip=40.93.194.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XOfNOr8+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZWUoEG9loX3BM74D8oF4VjHdtXzfc+VpQJ1SMtMy2VSkJJIRAKGmFCnHOK3F2nHfwFlR1TRvAS20f69gp35qoShEXivJdLIf8dz+r/XPxpm8a5INHHevuFqSHiFGXr5NMN1v17W/4SKrfFy9BDZh3Mrm/EdBEYfTDgvc0+1wSaZs6TwoPB06bp/8n2zw57T+UQtFd0v8Pw5VBG1RU20YdcJeXkFg6MqH2hKCpu+DJdskNGQcml3Pwgsz05FjfVTKioVfxHAXlPyx+vgLjsTlIDxFvqcyqbrIIo12O/cIvWRIkuC6rk+J+m0SCMJ8VX4YECIdRt5dRseYRb1+Vn9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gCXctdlO0zbY/G0m0+Z5fOuX0W4QxODveRR/V5UphI=;
 b=ZwPIHw5+ikMl7uhr6+hcGdeMKECldlC2sPzETI0EwicR6+RnJ6bOu3hTyb59ksfRw1fQWu7HJWJrmp2Pn7halCUJR8AUZHEPu9QKvNBoSxQ/NBfTYHgZcz5Ccq1kXZbNghvYL1/3HYECk5V+34dKE3GzR5aAyA/731Rx1Ougx6HDmx+N+W28L9I5OYAuQW6jzhS4Nv/elJtmkEK7mNVvo2nx0bPEX/olvoYLSWIzonjZU8zZNC3ov5dOr+iMnIHPi6LB4POA4lCJWRa8luv46byapIctR2BSKpt59LQ/T/zLtHiuv/51WrN9KVr7eF6XXk4q2WU/HFefGDRCWr7i1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gCXctdlO0zbY/G0m0+Z5fOuX0W4QxODveRR/V5UphI=;
 b=XOfNOr8+1vgbAuwbByTucJIHEZ8UQY3UDq5D3mYzt+C0mQiWZN+IRrT1qVHRAR1oe8aCj6z9C7Xy3gC/5AdbQWpqxZfYJ3+pGIKNItIje79EHGEpjFHY8/GQJRoiF0aFEwTYAgP80/s9yrhEvpO3xzBHO8ji0tWU3jsy3OOf6A7Ngr36PWOyB9Kq+wtr8IhFdj9v6bJ7z1eemx4JMqnBoTMCH1jAk+5ueSPKkIy0hj2WJfmEbx3bmA13+BN86W+VNBqhfUr1ygEjE3Vt8lhtLcd+MHaF7xFQCJWw2ZnQH/jcJOBp/IFLbFv+WHSuQGwECgzBbNLzQt2kMXcBSRUxzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:43 +0900
Subject: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-5-aad44f760f33@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: e8785b49-7315-4a1e-d123-08de73b0227d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3VWUkM1THBES1VpWFBKYm9yQk0xTzR4cmJhQmRBNVNDZGVjZ2FUWXV5Tit6?=
 =?utf-8?B?cDIvVWN6Skx1dS9HODZqQk5TTGhQVGowQTNYY014TmhkWGpiMDNOYnVCMCtQ?=
 =?utf-8?B?UkhxeWREUHJkQUtHNzZ4cHlyL2hwY3lJaENXQ1ZRZzFaYUJuNTdQcnVEUGw0?=
 =?utf-8?B?c2NiU3l5NlBCdmtwQ0dueFJXZjRZcm5EZGxWRnZwbGpmNUdHZzlRUUpnK0tK?=
 =?utf-8?B?azFQSkZ2SVdPVzBzRUdQN2RBMFAvampsSzhJRXhvS1F1eEZ0RlpWWXNpcmN3?=
 =?utf-8?B?azFmcC9TbXVpRlFkaWNFbFl5Y1hzdXJMaDY1UDFWV1lOUk44b2sxRy9Cc3Fl?=
 =?utf-8?B?NTR5RFdiaFFGcVNpL0wwRnRNaDNCblNtV2FsdnVUYW5DWE9mTUR3R295S0to?=
 =?utf-8?B?cHFFRjY2ZXR1OEo1WnZ6MlA3ZGIzUlpZWExqb0RZcFdYbWxWSlVlUzJkOFdP?=
 =?utf-8?B?dkZ0TnIxUnMwSzhGWU9HZVJydFFtMmhFUXdGUWRrbVErUGFoTUVBc3pTSzRu?=
 =?utf-8?B?dzFxa3dGSDFoUVAwdmZiMlpwTU9lZTI3WlAyaDJQMlVJcHk1MFA5N3JqdVhm?=
 =?utf-8?B?THczQmR5RnB4RmozOFNoSWR5VDg4QTdsWnlxZ3JSUFE3anlIZFhmR0drZnpx?=
 =?utf-8?B?UHdBd0xFZ2R3eHVQOXNoNDJtVzRFa0xhSmFXWUVaMGlSNDlZMFZhUzRaQmhs?=
 =?utf-8?B?d09kRWdiL242bUUxdTRUeHJaSXVIR2lEU2MxL1JQQXlma1pTUEVsd2F4ZXRs?=
 =?utf-8?B?dW1QNTBLR2M1M0FXR0JjTndvU1dZcVZrS1pkMkk4ejZ0bTZXbHYrYW0yU2c1?=
 =?utf-8?B?dXhxaFo2OUpDZkwvSGJsRnVJZzhBalJwaUpBUDlkUnFyQ1hXR0RXMXhmRDdm?=
 =?utf-8?B?Kzdlc00wem16ZlRCQzBJS29hWGQvcEpIYjhiUktIdjNQTkdhMVVIQW1ERTM4?=
 =?utf-8?B?QWtuQlhXcURYQUZGSVdvTlZSZ1ZWMUUyTU9OWXZhSVFSYWgxT2Y3dEE4OXZF?=
 =?utf-8?B?ajVNbTZndFlNbU5veE5GNXFQa3JqakJOczJvcjVaei9kMXByeE52VVcrU3Qx?=
 =?utf-8?B?UzFUOHBjVEwybTd1aEdxcXFGeHdzRFRqVFdSeGZGUnZZRGFxdkx2d2YvSEhq?=
 =?utf-8?B?RThObXpaQm0xSjRRZ2FpT3Z3WFV6UFd2YzlVa0xNV3dTeVo1R1lPOFoyRlNp?=
 =?utf-8?B?dTUxNG5waDFtb3I4TXBNWEVsL3RPdGFCZVJuSFhSb2NQUTF2RHRwbWMxMmpJ?=
 =?utf-8?B?NWN0bExiazNIcVc1WVFSR0d0aGppYVI0KzdUZU5yOEhGdTg0UnU1MytSRVdN?=
 =?utf-8?B?cCtMemZ3Wkl3UUgyd2hEZUJ4VkppUCttUzVFMG1SUGptYndYK0Y3SVVmeXgx?=
 =?utf-8?B?UDA1YmZndDIyZmFyMnZNemJhcWIxZmlFYWgxdkZqVlQ3UFBQN01pV1ZFcVY3?=
 =?utf-8?B?LzA5eDBsM3JjNzdDeUllM1BmTXI0MUxNN3RsM1Raa1N4REZiN3JCTS9lMVlP?=
 =?utf-8?B?amFMUXZPc2prNS9TYXgwb1psSFdYSTN2RTRrQ09uV3N2YjJnVTF2VEY4S3Zs?=
 =?utf-8?B?YUNWWVpNMU9vMDdrOFI0UmVaUlNrVEhCRzJmLzNPWk1ieEFFK0UrSENxTGlK?=
 =?utf-8?B?ZUtqSmRVd0RVcUNSK1JlNTNTUjdJY0pSTk1ja1lJbFFWQXFYcEdDR1c0ZEQv?=
 =?utf-8?B?dENsWGpNMURyU1pNUFZhL3RWT05ubGdkRjR0d1lENU9qVm1mRnU1Qkl4eHdJ?=
 =?utf-8?B?aWlGaFUxRmxsQWYwZm9QY3VZTnlzcllnSUg4Snhwc3RTRjFxMWpUZE1lUlQr?=
 =?utf-8?B?ZHd4UXJYa1dnU3NZNHJkbTJOVE9KWjVSNUFwR0k4Z2xKMWx5eDArQXV6S2ZX?=
 =?utf-8?B?NVFtU0NhUWpJYzFEU0NOV1JzbzE1QUNwSG5iaXhTQnJOa1VJbXNRbjlNREpt?=
 =?utf-8?B?cnVLVlZKRmk0UC9XdW5jdUJTOE9kOStTcE5HWEw0K3d2VUJMaDRCWEpwTGpS?=
 =?utf-8?B?NVlTeDdOSmhMUlRYTEpPR0dsZUFyeG45VTNodENuTnZhYjN0Mk5wcE9TdHNk?=
 =?utf-8?B?QlU4SzJQRFFMZXdWUTFQaUwrYUdSYy9QUDk0NXF2ajIrVG1OY3AwZUxKaVh5?=
 =?utf-8?B?ZndIWkErWDhuckw2TkZiOStEUnFiUFBzVC9HU2ppMzVaTXFVOUxLdUJ3MEls?=
 =?utf-8?B?bEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU9CSHRrM1lpNVFyVGd1RHBkZSsrdGo4bjR4eldMQWl0R1E2cUJRUm5MWlUx?=
 =?utf-8?B?dk5qenViSDRNZlcyMzdNOU9aMnRsK2xFV2ZkUHVWOG9jb0Jrdy9hVE5hZ3BK?=
 =?utf-8?B?TmpSdlJwTWRacG5YNVFwZ3dCVHYrMzM3YzBEMU03WnZHRU9sSDFrVWRuVUFN?=
 =?utf-8?B?MDJwbDhvdTFZSXQ3Zk50bVJwN0ZJT3Z3ZUZyODlvL3Zid0RydEdhci95b3FL?=
 =?utf-8?B?MDhzUzF3KzVHUUg0YVVIRTNhbDlDRTF1T3ZFeER6S1pHWEFsT2x4Tkd3aHpv?=
 =?utf-8?B?OThTK09lakFNbXVGc0ZKYVQwUGpoZDJnOWVxcmgxWXRWeDFVaGtIS0F0YVJl?=
 =?utf-8?B?WStEVDFWbUVRc0JjL1hGTS9rbDF1RjRMdFB1ck9Yc2tOOTlkMVgrYmxyRWI3?=
 =?utf-8?B?KzdDdDBiUXRRbVFtdnV3ejhBY29IT255N2loK1hFcDZqRVc3VXl1TGZ1enFx?=
 =?utf-8?B?UHNKS1dVeCs0dWR1dkNmcDUzcE5hOHlLWDFCWWppT3hpRnNvN29ET2wyc0h6?=
 =?utf-8?B?TjRFZmRKdDY0bEs5ZjloeVE0akxUZ3lGZTRmS1JMMm5pUU43ZUd5ZTJSQVZi?=
 =?utf-8?B?d2FkYWFZeTFkYW9xNWhSVzlIUXVFR2E4SzZBV09aYnUzRitMbUZDY2x0R3dO?=
 =?utf-8?B?cEs1QU1SRUMzWk5kTkxONmNvdGVKNzNwRjc3VDJDclpIazFVMm4xT0MwR0RD?=
 =?utf-8?B?K1RLaFJoQnRSVEpjOGRTaDBDc1Nib1lXYVFmdzBCMWt5TVFudHpiY2FJQnpO?=
 =?utf-8?B?VFBWZFFMTk5QajNRRythTXF5bGVKY2pLUUE0VGkzZWhRbnlVNTh1em8yTmNx?=
 =?utf-8?B?WDhjTzl2OWpXVlgyUWt0amoxQUJNODRNZmZXNklOZ2UvaDEybUJoWXNZS0xB?=
 =?utf-8?B?cEY4dUMxNDdnSDdIWC82Ymt4SHFaRlRyVGJLMlQycWNRMVQraFZpWVBIdnFH?=
 =?utf-8?B?VkZ4M0RNVG0vSk1nVzRDYyt6cmQ2QS83K0V0bXFtamk0YUsrWHNaTVhLWk55?=
 =?utf-8?B?RFAzODVUTjBaYk5UMjRIM0I3VDlTU1h5dEVFRWtIZlNFTkxHaXk3eHR2UUNJ?=
 =?utf-8?B?YktpQVFnc0FyRjUxbDd1SGxCRHdVK2tad2FUQlltYURsblNiTC9mYThtRTlo?=
 =?utf-8?B?OHZJRk96bEpTQXR5VXMzaWM5VXlkUzNza2xYQnEvV0ROVWpNd3VYUytQdDlW?=
 =?utf-8?B?Z3FhdjJnUVAzaWk5b2ZXN0MwNmx5MSttN2h6TWhRRVRqc1I5cGVZWmlhTDRO?=
 =?utf-8?B?TmVTVHM3dGxhYU5WaFFQQU1EUWJHaXhvM2t2N0RUL0xxeXFSdWZGdHJZTHFH?=
 =?utf-8?B?TnlkSThTVHJnc2NwVENDazQ1cksva1ZOZkhuSUdGcENkcnFVTXkxeStsVDBa?=
 =?utf-8?B?V0NXcGhOTGhGeGlocGxib09ZRlk4aW13SUNWV2h2OHMxNUUrTUtzZ1FYVy9u?=
 =?utf-8?B?YVhtSTFtWXlVQVM4bnBFT21STkt1V1RTYU5ZdGVKZ1ltRVp1Nk1pWXhNTm84?=
 =?utf-8?B?YUJrRE9ZTmVZRGdpekoxSW8zbEc5bTNWckNFYlMwVzVDeTFySXdqVTF0dTJv?=
 =?utf-8?B?RnVWT3pGWkFUdnJDR1BuRlh5dTAydm1ZQnpXd0Z0OFdLNFlkL0lSaHdORXRF?=
 =?utf-8?B?Z0NBWG1QMFVPYmlhcnVZNEVhZTNJSVJiWE9sMStJQ1NHLytNWkZ4bGRjT3RH?=
 =?utf-8?B?WFZsd3dQSGNWL20xSGJkREJLa3ZsczhDdmNnQUxSWGNGcDFaNWZjY1UrajRV?=
 =?utf-8?B?Vm9mR3MvWkg5cGEwcjJJenNnY2RtdmFVMmhOektRMGdhanl6ZVM2ZEwzU2Rp?=
 =?utf-8?B?S2RrSy9IRVRFdzE5SnRNVEpOdUd1dVlPRGNzcFk2ejFhY2NiV09RQ3lzb0hj?=
 =?utf-8?B?bnVDcGdhU09xL1B1ZUpkL0VXcTN5cHhhTFJyRWhqeVhFSDFJOHhiTGlEaEk2?=
 =?utf-8?B?OTNpd0ZLS2VzWThaUWJCYkRtZHZYVlJhZDU0emNzbDlocmZERkVpRzIzVEZZ?=
 =?utf-8?B?TFpiRFpGWHZ4L1A4R2FBNmhsYk1WYWw2ZzBvRWxBeDNsWkNSNGRqVWRDSHlS?=
 =?utf-8?B?UXZHM3h6dkhxMjdvOE1uUFZ5VnNMelJLQmIvUmJ3SEwrSTdQSU5VdXVjbks4?=
 =?utf-8?B?RXZKZExicTNJcDB6RE9uWDNZRXVRK1ZLaDNvRWsrb2hHSWNaNE54N1ZwYWlS?=
 =?utf-8?B?STNJeWdUbFhxM2F5Q1lJTFpXT1JzK3BYWmsvTldHaWp2NEwvRU1YL2hhOHFC?=
 =?utf-8?B?T2ZNWndyYkU3SXB2SEduZnlPWEZYQlFGQnhuTjFteStabDBoWU9zYVM2VG5a?=
 =?utf-8?B?VmhpdzcxckRFRThzQjAzQ3F3a0JxeEpPcGxGY3kzZC9qakttdSsxT3o0OE5B?=
 =?utf-8?Q?nfYGtAjWVT6+oyDqHdc2ec183mVPMBGR0z+eWBIU0Xxsd?=
X-MS-Exchange-AntiSpam-MessageData-1: 2/Pnx57WiqCbnA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8785b49-7315-4a1e-d123-08de73b0227d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:26.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksEDJf9wE/Vqq2KRRsqhAJVA0FaZXvfpo1p+qUYjW1QI1ItwcsGREMzvr3NqURqnq1TqA/vTdR6tSfXUv4v2Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

I/O accesses are defined by the following properties:

- For reads, a start address, a width, and a type to interpret the read
  value as,
- For writes, the same as above, and a value to write.

Introduce the `IoLoc` trait, which allows implementing types to specify
the address a type expects to be accessed at, as well as the width of
the access, and the user-facing type used to perform the access.

This allows read operations to be made generic with the `read` method
over an `IoLoc` argument.

Write operations need a value to write on top of the `IoLoc`: fulfill
that purpose with the `IoWrite` type, which is the combination of an
`IoLoc` and a value of the type it expects. This allows write operations
to be made generic with the `write` method over a single `IoWrite`
argument.

The main purpose of these new entities is to allow register types to be
written using these generic `read` and `write` methods of `Io`.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 241 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index b150743ffa4f..fdd2549d8e13 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -173,6 +173,158 @@ pub trait IoCapable<T> {
     unsafe fn io_write(&self, value: T, address: usize);
 }
 
+/// Describes a given I/O location: its offset, width, and return type.
+///
+/// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`]
+/// to work uniformly with both raw `usize` offsets (for primitive types like `u32`) and typed
+/// ones.
+///
+/// An `IoLoc<T>` carries three pieces of information:
+///
+/// - The offset to access (returned by [`IoLoc::offset`]),
+/// - The width of the access (determined by [`IoLoc::IoType`]),
+/// - The type `T` in which data is returned or provided.
+///
+/// `T` and `IoType` may differ: for instance, a typed register has `T` = the register type with
+/// its bitfields, and `IoType` = its backing primitive (e.g. `u32`), with `Into` conversions
+/// between them.
+///
+/// An `IoLoc` can be passed directly to [`Io::read`] or [`Io::try_read`] to obtain a value, or
+/// turned into an [`IoWrite`] via [`IoLoc::set`] to be passed to [`Io::write`] or
+/// [`Io::try_write`].
+pub trait IoLoc<T>: Copy
+where
+    T: Into<Self::IoType>,
+    Self::IoType: Into<T>,
+{
+    /// Size (`u8`, `u16`, etc) of the I/O performed on the returned [`offset`](IoLoc::offset).
+    type IoType;
+
+    /// Returns the offset of this location.
+    fn offset(self) -> usize;
+
+    /// Turns this location into an [`IoWrite`] with the initial `value`.
+    fn set(self, value: T) -> IoWrite<T, Self> {
+        IoWrite { value, loc: self }
+    }
+
+    /// Turns this location into an [`IoWrite`] with the initial value `0`.
+    fn zeroed(self) -> IoWrite<T, Self>
+    where
+        T: Zeroable,
+    {
+        self.set(pin_init::zeroed())
+    }
+
+    /// Turns this location into an [`IoWrite`] with the initial [`Default`] value of `T`.
+    fn default(self) -> IoWrite<T, Self>
+    where
+        T: Default,
+    {
+        self.set(Default::default())
+    }
+
+    /// Turns this location into an [`IoWrite`] initialized from `0` and transformed by `f`.
+    ///
+    /// This is a shortcut for `self.zeroed().update(f)`.
+    fn init<F>(self, f: F) -> IoWrite<T, Self>
+    where
+        T: Zeroable,
+        F: FnOnce(T) -> T,
+    {
+        self.zeroed().update(f)
+    }
+
+    /// Turns this location into an [`IoWrite`] initialized from `0` and transformed by `f`.
+    ///
+    /// `f` is expected to return a [`Result<T>`].
+    ///
+    /// This is a shortcut for `self.zeroed().try_update(f)`.
+    fn try_init<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
+    where
+        T: Zeroable,
+        F: FnOnce(T) -> Result<T, E>,
+    {
+        self.zeroed().try_update(f)
+    }
+
+    /// Turns this location into an [`IoWrite`] initialized from [`Default`] and transformed
+    /// by `f`.
+    ///
+    /// This is a shortcut for `self.default().update(f)`.
+    fn init_default<F>(self, f: F) -> IoWrite<T, Self>
+    where
+        T: Default,
+        F: FnOnce(T) -> T,
+    {
+        self.default().update(f)
+    }
+
+    /// Turns this location into an [`IoWrite`] initialized from [`Default`] and transformed by
+    /// `f`.
+    ///
+    /// `f` is expected to return a [`Result<T>`].
+    ///
+    /// This is a shortcut for `self.default().try_update(f)`.
+    fn try_init_default<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
+    where
+        T: Default,
+        F: FnOnce(T) -> Result<T, E>,
+    {
+        self.default().try_update(f)
+    }
+}
+
+/// A pending I/O write operation, bundling a value with the [`IoLoc`] it should be written to.
+///
+/// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`], [`IoLoc::init`], or
+/// [`IoLoc::init_default`], and consumed by [`Io::write`] or [`Io::try_write`] to perform the
+/// actual write.
+///
+/// The value can be modified before writing using [`IoWrite::update`] or [`IoWrite::try_update`],
+/// enabling a builder pattern:
+///
+/// ```ignore
+/// io.write(REGISTER.init(|v| v.with_field(x)));
+/// ```
+pub struct IoWrite<T, R>
+where
+    R: IoLoc<T>,
+    T: Into<R::IoType>,
+{
+    value: T,
+    loc: R,
+}
+
+impl<R, T> IoWrite<T, R>
+where
+    R: IoLoc<T>,
+    T: Into<R::IoType>,
+{
+    /// Transforms the value to be written by applying `f`, returning the modified [`IoWrite`].
+    #[inline(always)]
+    pub fn update<F>(mut self, f: F) -> Self
+    where
+        F: FnOnce(T) -> T,
+    {
+        self.value = f(self.value);
+
+        self
+    }
+
+    /// Transforms the value to be written by applying `f`, returning the modified [`IoWrite`] on
+    /// success.
+    #[inline(always)]
+    pub fn try_update<F, E>(mut self, f: F) -> Result<Self, E>
+    where
+        F: FnOnce(T) -> Result<T, E>,
+    {
+        self.value = f(self.value)?;
+
+        Ok(self)
+    }
+}
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -406,6 +558,95 @@ fn write64(&self, value: u64, offset: usize)
         // SAFETY: `address` has been validated by `io_addr_assert`.
         unsafe { self.io_write(value, address) }
     }
+
+    /// Generic fallible read with runtime bounds check.
+    #[inline(always)]
+    fn try_read<T, R>(&self, r: R) -> Result<T>
+    where
+        R: IoLoc<T>,
+        T: Into<R::IoType>,
+        Self: IoCapable<R::IoType>,
+    {
+        let address = self.io_addr::<R::IoType>(r.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        Ok(unsafe { self.io_read(address) }.into())
+    }
+
+    /// Generic fallible write with runtime bounds check.
+    #[inline(always)]
+    fn try_write<T, R>(&self, op: IoWrite<T, R>) -> Result
+    where
+        R: IoLoc<T>,
+        T: Into<R::IoType>,
+        Self: IoCapable<R::IoType>,
+    {
+        let address = self.io_addr::<R::IoType>(op.loc.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        unsafe { self.io_write(op.value.into(), address) };
+        Ok(())
+    }
+
+    /// Generic fallible update with runtime bounds check.
+    ///
+    /// Caution: this does not perform any synchronization. Race conditions can occur in case of
+    /// concurrent access.
+    #[inline(always)]
+    fn try_update<T, R, F>(&self, r: R, f: F) -> Result
+    where
+        R: IoLoc<T>,
+        T: Into<R::IoType>,
+        Self: IoCapable<R::IoType>,
+        F: FnOnce(T) -> T,
+    {
+        let v = self.try_read(r)?;
+        self.try_write(r.set(f(v)))
+    }
+
+    /// Generic infallible read with compile-time bounds check.
+    #[inline(always)]
+    fn read<T, R>(&self, r: R) -> T
+    where
+        R: IoLoc<T>,
+        T: Into<R::IoType>,
+        Self: IoKnownSize + IoCapable<R::IoType>,
+    {
+        let address = self.io_addr_assert::<R::IoType>(r.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_read(address) }.into()
+    }
+
+    /// Generic infallible write with compile-time bounds check.
+    #[inline(always)]
+    fn write<T, R>(&self, op: IoWrite<T, R>)
+    where
+        R: IoLoc<T>,
+        T: Into<R::IoType>,
+        Self: IoKnownSize + IoCapable<R::IoType>,
+    {
+        let address = self.io_addr_assert::<R::IoType>(op.loc.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(op.value.into(), address) }
+    }
+
+    /// Generic infallible update with compile-time bounds check.
+    ///
+    /// Caution: this does not perform any synchronization. Race conditions can occur in case of
+    /// concurrent access.
+    #[inline(always)]
+    fn update<T, R, F>(&self, r: R, f: F)
+    where
+        R: IoLoc<T>,
+        T: Into<R::IoType>,
+        Self: IoKnownSize + IoCapable<R::IoType> + Sized,
+        F: FnOnce(T) -> T,
+    {
+        let v = self.read(r);
+        self.write(r.set(f(v)));
+    }
 }
 
 /// Trait for types with a known size at compile time.

-- 
2.53.0

