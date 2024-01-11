Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F4EAC5
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="rptpv8uZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX3Dc/QUwEn8lwBMnmazBd4ZtZ6hMyfR7hG1m7KXW27zmMcW9hBSs9cai0C61IUYNVu/8sdBs7wBozU74ikg0TUZRMkUBGSJBDGgQ5N09gMryGa6P9JRW32XHGv/km5yFzIcaeR/HhbWXEfn+RsgqzFekGfz3PgtI9MI1V7fPB3lwUiaWHXids7xJvBLk/fuS0DA8aJrlPo4jpRNMVaVka6DFnLpkm2GQkWehqBn0a9ZnDUBF0xGOJqK/0/uo1eGfMc5uv0fn1oThEYOBxD925To7dmjbBJ86KDA6gAchvOdlq7u8VO8ED529IY8wGeaFCn4xP2O1R/l1UaA8od5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxSgnq6s0DVJquusBkV6G/dKcKwUifCHwOMXBuUUh10=;
 b=OH3MzXVTsFvz6Omxb7i7cL+90ypasmEb4G+U4VD7lYxlYUB+ZqaSw37jryE5UFYqsQZRgdvs+lyCZDSGqoihDhYJBtopyV+mUyUJqhKNSMJd19ApX/UAAfnp8ePnO+CIdIvGVlNB7ILaiFxlGPBHgdvZduIMW8Yvcu5xN/YvJ9s5B20xQjF2tVAgbHhE2BmF6bVLTRENWhrtWYo+Y8v4a/fSNIQ7XmQhB0XK1UnCHZMaFcyJmg6WAZM9uNrwfUAfSXD0NhNftWHV0k4JY+R/8md2sL55EmXIBbkW+ummGS0EqZPlgvCcHl9MyP2Q3zKwHfsc//cpZoEt5CUYziYGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxSgnq6s0DVJquusBkV6G/dKcKwUifCHwOMXBuUUh10=;
 b=rptpv8uZNewQsCU37OvRVZKTOV/RmQyS7gUJu/zfkyVcuVuqXMhfDFLfYL/VD7XXaz+1HWBbsK8UWeNSlpNH3CAaTUsgCkm2g9ygjQq5UJkS71NYATOXDmb24iUCmGAhK2lP4FkPkTavKPXA/IjGwqLB19ICmAvCUXnxGD3cSRNjq3JIEQ64y0B3DiPvTc8IDRay+mM8ZNyr4g1PCivDsy3TCZVlpQAXV+Ex4gKhLLuCjbRuiLkKXh+sxcC16pNCOIXiTixlhVe4vvtblhxNKc3jZSsnv+sNils7/vqr9++Wgr5Zew0yrFt/cq/jMlLA36+oKZWAppwdvrzaSOOc7g==
Received: from AS9PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:20b:531::9)
 by DB4PR10MB7039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 08:14:21 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:531:cafe::6c) by AS9PR04CA0129.outlook.office365.com
 (2603:10a6:20b:531::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Thu, 11 Jan 2024 08:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Thu, 11 Jan 2024 08:14:20 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jan
 2024 09:14:20 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Jan
 2024 09:14:20 +0100
Message-ID: <36117a36-18e9-4961-8761-ed32f8cce02e@de.bosch.com>
Date: Thu, 11 Jan 2024 09:14:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
To: Greg KH <gregkh@linuxfoundation.org>
CC: <rust-for-linux@vger.kernel.org>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
 <2024011114-tartar-jimmy-9e0d@gregkh>
 <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com>
 <2024011108-shortcake-underwent-e12d@gregkh>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <2024011108-shortcake-underwent-e12d@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70A:EE_|DB4PR10MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: f38ae321-11a7-47cc-9008-08dc127d507b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cJYBuMde2x/2sTgbdkFtI1mxCmETVZXtfrxyPXGKFPiB3ZNJX3eNnzbI0E6LMUiH4xULFA5LUFy7VkN5K9C92s7bfAbSakROt70ALCmdwxG79nqz5CEZJcSW5MDtnkl03DLd8/pR/GyJuXvATKV5zIhx8Rh5zt26aoaJYqsmMf24SW5cqIceUS98Ms5gzGkBjrGA+AlH6aiVG3bjZHon8WPsUND9K5pCvkwCVsgG+VBqTuwmf8MeYioADur3UWwYQa53cdXGJG4pWg72G0aDrJVp/4P0sUXkUosYObtGLqIz+MHChBnLZAMDYilxZh+doGitoSZjwQCM2I5NilFaWuZK8pKWdZQ/ci6xxR7zPIxubK82GWtUkWk3wQJ4TUmIK0TTWIwSKicZ1Fw+c3jF6XjvmWRZKcYw1/66VW14wI5/B+ii194WmBpOu3tlxCqK492O8mSZnrXdT1SOj+wbdXfCn/kRmX3bQrcCVAqL19pMRwhWoq/BIl/2fmCJBjDPt8haw73ybm27QQWum9NMuWjg5CssNcBUzucPXNZqI5Dg5EIpgM1ru9N1REWn3zmda22Awf1+mGdjKeSOeZn+muA2OISOQBjfpoFg87KXiLAlawPjlcDwPOpDYUSufMZ8CHPNmoMDjB7Wx57ZHoiOeXaq/WnJjz5boCAUZlYDiQY6CtM4xZPFauJ4feMF/0nDkIyrEDEW+TmxTvtZdtiV7e7fTUwJv7X33MHBo5yOb1Kn4/gzjjTSXjr3ixQwWPa03lvNsQ1tZ6BBToOwGSDwz5wCuM2i1sYOzm9CkKjlXrg=
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(31696002)(81166007)(356005)(2906002)(26005)(41300700001)(86362001)(2616005)(82960400001)(426003)(336012)(16526019)(16576012)(6916009)(36860700001)(70586007)(47076005)(83380400001)(966005)(82740400003)(70206006)(8676002)(5660300002)(8936002)(316002)(4326008)(478600001)(53546011)(6666004)(40480700001)(40460700003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 08:14:20.9317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f38ae321-11a7-47cc-9008-08dc127d507b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7039

On 11.01.2024 08:54, Greg KH wrote:
> On Thu, Jan 11, 2024 at 08:29:06AM +0100, Behme Dirk (CM/ESO2) wrote:
>> On 11.01.2024 07:59, Greg KH wrote:
>>> On Thu, Jan 11, 2024 at 07:44:15AM +0100, Dirk Behme wrote:
>>>> The existing to_result() takes a (signed) integer from a kernel C function
>>>> and converts it to an error if it's negative. Additionally, there are
>>>> kernel C functions returning an unsigned integer where 0 is the error case.
>>>> For example gen_pool_alloc() and friends. Provide a mechanism to convert
>>>> this to Result too.
>>>>
>>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>> ---
>>>>    rust/kernel/error.rs | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> I'm unsure if something like this is acceptable. Therefore the RFC.
>>>> But I want at least ask ;) In the end this is a slightly modified
>>>> copy of the existing to_result().
>>>>
>>>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>>>> index 376280b6a745a..3306b8f590866 100644
>>>> --- a/rust/kernel/error.rs
>>>> +++ b/rust/kernel/error.rs
>>>> @@ -248,6 +248,16 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>>>>        }
>>>>    }
>>>> +/// Converts an unsigned integer as returned by a C kernel function to EINVAL if it's zero,
>>>> +/// and `Ok(u64)` otherwise.
>>>> +pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
>>>> +    if val == 0 {
>>>> +        Err(code::EINVAL)
>>>> +    } else {
>>>> +        Ok(val)
>>>> +    }
>>>> +}
>>>
>>> How would this be used?
>>
>> One (randomly selected) usage example:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/cpu/mce/genpool.c#n107
>>
>> node = (void *)gen_pool_alloc(mce_evt_pool, sizeof(*node));
>> if (!node) {
>> 	pr_warn_ratelimited("MCE records pool full!\n");
>> 	return -ENOMEM;
>> }
>>
>>> 0 is normally not an error, why would you
>>> need/want to turn that into an error value?
> 
> So you are treating NULL as 0 in rust bindings somehow?

gen_pool_alloc() returns an unsigned long. So we are talking about 0 
being the error case we need to catch via Result. Similar to the 
existing to_result():

/// Converts an integer as returned by a C kernel function to an error 
if it's negative, and
/// `Ok(())` otherwise.
pub fn to_result(err: core::ffi::c_int) -> Result {
     if err < 0 {
         Err(Error::from_errno(err))
     } else {
         Ok(())
     }
}

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/error.rs#n241

> I guess a usage of the new function would be good to see to clarify this
> please.
Something like

let pool = to_result_zero(unsafe { bindings::gen_pool_alloc(pool_ptr, 
size) })?;

Best regards

Dirk
