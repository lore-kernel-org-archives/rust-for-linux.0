Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7BD175A98
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776302474; cv=fail; b=QNCT4tEc56QIfYKUIM5wK4h0x0WdNjNQZzN3mGFAA/rcFuX/o77nE416nIGvYP5/Me98JGUSSMFBKEC2BseuJSfsI82zsqlPgExLbi64mGc5WtXvbN4R6rMYUcIFRxpEpso9kT1LVqfMKhpNuyoeOIlAlixgplPSd0YTzIHBY+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776302474; c=relaxed/simple;
	bh=cXi0VJuRk1t/EIuBKnSvxgVwwXuH/agVg2Lt0xWCuSI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cvjz37mzDxxot/zjThDDUb8pjHBjELftwnIybzpS0V7+USfR8GuDlooTrgld8S5Yz7IuRiCQ5OLRgBwPA7tqGe2g7IoP/BrbYq0VSrHgllBG7bRX1dUo5MkPhO44E7C4ZINyjK1094ch6XfZ9JRiEGwXgL4Zw3MMPVN1rzyHJ2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YbACUad7; arc=fail smtp.client-ip=40.93.196.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YbACUad7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYAwmt5bpwi4nrU7umIZ3hqVDPoreI3EIT4r7f+s1MeglWAxbwMmyZgr3UTjmZFvRl+yaQd199Nj8NgBOs9kVgwqDl8YjRb90imJ0M86KT4eByJsFyUf33h0v0+ytMpf/8CjY23ZTe6+ppksj7rgYEuheNwkOkjOMu49jtBd6mjH0yMvXjhkSKHHKsxTJG3eJvA+0/9h8oapoeJhyJ99F6gVU25swgVMIklIHVCP864axmJ0e/q9mETO1xFEdSa2fANNbSxKwNGIYty135mCftN03ljVA7ysmJsK6IPlkC1sza/BrLAIVKx+4dxLTXAhuJW6vT/455+vdWUetEqShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brgWxymWJlkZvNnzgMbxycx/dQB/hB0q0I/1gwEKlmo=;
 b=jVZCDoz3Myb6JUKQFC457+x5F1JR2hKCEzbMsN21F/xRPq8lYadzZd/1kMBwodKAwAWYDIfIy9t+ik0TcR6t/eguoLdHcz8gnuBGwFXiQ84YGQ7F5L4HQ4j9hmdw6YpfVqhiySe5fMWlRnPKqikMhxdvK7FFc++fgkFuheKeetNfF+hDlAo47Kca7vPOTSznYdb4Sb0xqVWCy1pRrD7WVLwjnZ8+7FUNVIcKaoxLf8pLZOapFLYxXE+OQNcT+G2flcLbhGLy1Wu6X/Rq+tShLgTJgq6vx4z/sJWUPfJNKK40l3cujS5E0a+TDjM6P+z8+YIlipJC2b5Xsx5nCcv1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brgWxymWJlkZvNnzgMbxycx/dQB/hB0q0I/1gwEKlmo=;
 b=YbACUad7ETZIlesUNi4hc13jOxcKbzkfEZ2DmAeLKkmZCWmYFyBQQ28u2Jl8PzK8QkRYyXdXFILk5Cjwyt82nC+3vLjOaa6+3fRhMU57N89VapQgMrOi1AZPLc/FrC9KlKNLx7up1X9gIzzPCzILDNeVPj0H6+xxir41Hme06LSbbgr/tAJycKSZinDKc89NhRZCSei62hkyjpjX3L5DP0pM8VVt3t8XLOVNoJlHkqG/+jOJ+sDVW1r/rjUAE4yOKguxWBMBf56dGu16fRkPnLJ3xEBjRSisBMpkvLeq9YCUmMoT+0CylBIo8gYnqTUm15Jd0ONTvkhK6bUPpS0Dhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 01:21:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 01:21:10 +0000
Message-ID: <9dccf93a-8eab-40dd-b865-368e818ce105@nvidia.com>
Date: Wed, 15 Apr 2026 18:21:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org
References: <20260416002619.900779-1-ttabi@nvidia.com>
 <20260416002619.900779-6-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260416002619.900779-6-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA5PPF6407DD448:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c62ad4d-1a65-4bea-3128-08de9b5670e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S5HPqgSJTNpS0sFXEcAo1NdBmYCqfnCD1JMuuTnS4C7ZlcHk9Ut57E6U3/onhRACdH6fh5abqDsArwZwApRVm5k61ZvxlUEAutQvF6G7xRVz6IQUMmxI/NIIG/BBI6ITd9n/GuMiK5+eWmCS62hc0+o9eD/kqhLv0beMq4HKEb5T8YE1UmKNOoKAydm1Kk2Ky39DrJFiBNPXvWQRqprnJRoKAf+c4uk2hZvqc3p/Kci0zyK1qdp0jEA4S3VBPkCChOquDILKOeMRG76eav/Hqg6wvXgYF6zYoAdNRAqjS5ZmdQ8MnqrPKIPl6jQ/bXoZtnjxurvlU+AOMGoCnrDxL+SxHY3AKMUzVo2ZNpaV2lr6vzJFNZsfv41pzavlmyJsECL/wdmGV6R6GlI4J7Pvf6bxo50/m29zspZRG82wnbzG0I4XfFx+2uuoFHOJBuK4a2nk89Y41hQDJg31KFk65krczoJSjl1wPTr27oqSv4RVOxmIN9NFw30l8N/bEZXEbybwin1h2bp+hulWg5NNSHkRhCzz5NtBZ7EI2CG/MF5UgD9BfxVQovoaI07wQ3rkqSR+lzIMgoNp8Belb5qewuq3PW17ne8D5C/0qc1WInwT6Y8BjgnDHO2PxDrb2BqjF+gdAAJArS1kx7gy4nsVB+Oj9xmPfk2RzSBvPnA1P2qEAmypjksxuwSzSKttN/TC83xyKRaOrjbql7tGKKwvfzOsEdCYVq+lLqbU5iiP/Yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXNwWi96N0lZSnRFdWM4Q0xmOWdOdTAxUTUySW9YVnFWd29sNmt3OHRWcHZW?=
 =?utf-8?B?ZEU5MjY4Y3pUeE5GajBoVEZ3Wm4xcFRUWWNETjB5VlVJZnovUnZGOThER0hI?=
 =?utf-8?B?enZXTXZrRFpSUHZhVHJaT0VvWFg1ZlFGcTVmdDdPN25yai9nUDkyOUdVNTNa?=
 =?utf-8?B?aThVOU9kSmVkbHRSbHY0OHBDamM3dzRabTFvZzkwcklKRmRYZ0NzSUgrdXAv?=
 =?utf-8?B?dTZibVQ4cVMxaGRkcUtTR1VwMU5YOHJhNjZibEU0eTBzWXpvU2FEODVJeFB0?=
 =?utf-8?B?bmxWMndzUVUwZCtGNTloaEl5bEFZdFFvT3dMWmpzQTU4bnFHeUJpVVpjOWlU?=
 =?utf-8?B?TnBpUnByNXpPSmIxZjBpbmNQcGlIUitsNkoyNUMxUFl3QWtZNDFkRzZybXpW?=
 =?utf-8?B?UFk3RlFtOWoyVEZuenlKa3lodktsWkpQTDRsR0tyQ0V1OU1HS3I4eDRDemtT?=
 =?utf-8?B?YUxBMFhYZlpheGRVV2hiZ0RycGZGWno4dTJrK21mZVhxMWgxTGFYR2FWZC82?=
 =?utf-8?B?RGw4SmVJd1FsMEF0a3ZBeGRzdHR2Y2llSm9UK3Z1c2tCZW9PTU8zdkNpS3cw?=
 =?utf-8?B?bGxXUjRYYWFCL291aWxaMmpBV2FVcEdmaWFLRUdkTlZMczBJdStiaHNuUXpH?=
 =?utf-8?B?c3V5L25tTWVJb0VXYWZ0eHFWb1VpdXA4eGRibklJVEk3eVJqcmlsNHlLQWw0?=
 =?utf-8?B?L0d3MWpvTjFMQUFCeGlsdU1jc2V3UjFNdTNZT1oyUmc5WEJuek9HYWd1Rkxo?=
 =?utf-8?B?QVduTTVIa2twYk1vTVZEZUtXcS9VTi9HY0FWN211S1BSeldHNTVWVlpSYlNH?=
 =?utf-8?B?TFI0TWNGYjBpWFErWFBPekNsRit3SThkd2M0K3JweVY0MnRRQXdrRGVhSmZ1?=
 =?utf-8?B?Z3k4RnN3andFOWF2c0VERTRJSTdaV29WejR0MDdDc0c4cllxcHRnSGFESlVk?=
 =?utf-8?B?YlNhVVNvOTVIb2c0M3E5SUNmbUdlRmRBZmtrVTZ6NU05NU9JVjcvb2FtT0kv?=
 =?utf-8?B?aW53RW00eXB6R0tMeXZqY0hyeEZ2eTVyWkNoa3VZL3ovcHNuc0N1WnVXQVBo?=
 =?utf-8?B?QlN0RHp3UTdSaHlYMzMyOGJKODdvWEY2ZkUxTWhVVzRMU2JwU0s5V0dlRHdQ?=
 =?utf-8?B?bUZYSUZlZFRsaWJ5YjF4dUdnQ2NEMUQ3VXhrcHNTWVk3WDhtcFFhMzBrdTIw?=
 =?utf-8?B?L0ZGcDE1MGZ5dllJMTIwaVNQR1NMMXZDYVRQdzFZcldSR0U1M1FTTUh5RmIr?=
 =?utf-8?B?ckFCNi9MZkJhQ21FUXdhaWNiRVBrbGxVd2VOM0xDbUM1cUtURkxadDRyeDcw?=
 =?utf-8?B?MnU3YUNMKzFXT0Jmb1ZQcU9HS1hiQlJPU1NLSldXQUliWThRZXpaOGo3eUlB?=
 =?utf-8?B?bzFISFJiMHRNMmJoQ1J1YktNaHhnUy9ScnJwbW5yaXRIY2lTUkJZOXNsaC9F?=
 =?utf-8?B?K2loZm9mUmJpcmZyVDRXOUFUeXh6NjdjbVYyYkp1TkV6WVBMVjYvSjZWTnNT?=
 =?utf-8?B?OGJ6RzkwdDRWMFNaVkdmemkwQlpEWFk4YzRCa0pHR2ZPMkp3T2FMc1JpT0dO?=
 =?utf-8?B?bU5aTzhwQ1Vvd2JvWmYra0luRVhwVnc4ZjNlLzlFZUlsTmFjY09QejRqdjgr?=
 =?utf-8?B?dVZQaStuNjlTdXVlOTlLRXp1V2xMU09kUU9zN3hOUUZrNUJuTGwveDlIOCtn?=
 =?utf-8?B?U0ZBR2hKYzVuWjBXNHp6MlNzL0NpNS91bDdvcG53NmtDcTZ0SnliU05iOTdq?=
 =?utf-8?B?QldpWGJTWlhRS3JjaXFvTVhEVUJDaFNFaDRIZDQwRnc5dktnT3pQSjBTbkhJ?=
 =?utf-8?B?TDYrRUxLZ1ZWZGRGVmlJYndJWXhTTGVMcUxkeDZuTUswT0thaTBzR0d5TU1r?=
 =?utf-8?B?enNsL2xZMEFQUGZsSmdnMHZqYjhwY3QxMVJlL2ZpWFBkUy8vVkwxcDFwZ3hO?=
 =?utf-8?B?RGpnNHVUZGdHRzZNbmI1a2xRRTR3S3ZVTnJ0ZVNNNUhpeURCUWxZNkk1S2ZX?=
 =?utf-8?B?alY1U2tONDdQVkk1Ly9HNVY3ZGFqcVZiSWFaZkdtWHM4RUJjWXNaWkFnUm1m?=
 =?utf-8?B?aUdSUFpMdm1zU0VOeWNPS0J1b3NlUE1wUDlmbTV1dGs5cWltZWFPaVR6dDFs?=
 =?utf-8?B?RW1SQVVnL1pFcFRMdTh0aEdqaW91bTBvRnJoZTFmY0tUL1B1KzlXQ3pQRjdS?=
 =?utf-8?B?QWd5UnFaQjg5NUMzRURiR2dRY3FkVllabjkvVEFQd0VxdnZxNGRMbDNHTmE0?=
 =?utf-8?B?ZWhsNmdid2ZXaW9tQWFQS05LZ0JIZlpIR2d6ZDlqUmxVUllXMkszWE5vdWgr?=
 =?utf-8?B?R1N0WjRCZWVhNVY0YVZrQlRnclQrR2NnNG9mOE1XRm1mbU9WNFZnZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c62ad4d-1a65-4bea-3128-08de9b5670e7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 01:21:09.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdkBAS7jJML2m6O6EIMUx9VZYqczDV7QJz8CNaKLYiUX/PHU/QFxkuhZpkbbxfWpJGLKjsWOFs+DYNjd9tTKtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448

On 4/15/26 5:26 PM, Timur Tabi wrote:
...
> +fn current_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> {
> +    let signature = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED0).signature();
> +
> +    if signature == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
> +        let fixed1 = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED1);
> +
> +        match fixed1.version() {
> +            // Note: We do not actually expect to see v1 or v2 on these GPUs

Then why even match for it? No need to "support" HW or FW that doesn't,
and won't ever exist, right?

thanks,
-- 
John Hubbard

> +            1 | 2 => {
> +                let fixed_data_size = usize::from(fixed1.fixed_data_size());
> +                let pmgr_rom_addr_offset = fixed_data_size + IFR_SW_EXT_ROM_ADDR_OFFSET;
> +                bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)
> +                    .map(|v| v as usize)
> +            }
> +            3 => {
> +                let fixed2 = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED2);
> +                let total_data_size = usize::from(fixed2.total_data_size());
> +                let dir_offset =
> +                    bar0.try_read32(ROM_OFFSET + total_data_size)? as usize + RFW_FLASH_STATUS_SIZE;
> +                let dir_sig = bar0.try_read32(ROM_OFFSET + dir_offset)?;
> +                if dir_sig != NV_ROM_DIRECTORY_IDENTIFIER {
> +                    dev_err!(dev, "could not find IFR ROM directory\n");
> +                    return Err(EINVAL);
> +                }
> +                bar0.try_read32(ROM_OFFSET + dir_offset + 8)
> +                    .map(|v| v as usize)
> +            }
> +            _ => {
> +                dev_err!(dev, "unsupported IFR header version {}\n", fixed1.version());
> +                Err(EINVAL)
> +            }
> +        }
> +    } else {
> +        Ok(0)
> +    }
> +}
> +
>  impl<'a> VbiosIterator<'a> {
>      fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
>          Ok(Self {
>              dev,
>              bar0,
>              data: KVec::new(),
> -            current_offset: 0,
> +            current_offset: current_offset(dev, bar0)?,
>              last_found: false,
>          })
>      }



