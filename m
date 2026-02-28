Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A515D6BB5B;
	Sat, 28 Feb 2026 06:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772259073; cv=fail; b=rD6FVOVbUBzEBSWGufSLTyLdAXWnphYgWns/sZ8ssiAUbsCnr6p2RyTZ+EtT2ya9V89CE+QHnRRC/XYvQ8BraAe6GUXkWzof4mruJ0LopTwzaWQ0nEUIGILlsuGXzBLsKDpUx0YSL3kSy4+EmVi5NwUphky+47dPRjryb2z84rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772259073; c=relaxed/simple;
	bh=aD/QbBN/ZXL2Z3A/oEYP43Bqgur6RNTByw7luBzrFKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=juRhVWikO/JPLSK1qBJllvpj58vat002DstrN3DIBMZ3ujPz6arUxWMp+1HWaZlfmFrwkx7j0mKClADUtVmX2O4ltnGhoNYU0gU9+bEgoe06nj5SF0mK1qGLD1l2mZozTEdTnTyKUasqDIX0Tsu6Z5qggRYO++gIv/DXsefj27s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U/tfyybX; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U/tfyybX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0o3MxOdy7VmTZQRPxKkvsZa+RQgPXFCNHFeyTfv9VINWMrm2GEojj4WGRizk/YU0/X6DgdXcfol1JtAg3t3U7/VSrevJOoYdH4ia1VoNOBpSjbEx39NIFmaj+fBKPx+XjXqkpU7piZhTZayyry1LaNuS6PPK/6Ic2tqqm7GoQVcgepiM8C0Mh6HOaIqchQtf63pRVOgv4C0x15b4Ms3YE0hnwaQJNHHejHL4TXE3b9WheB1fbq8ws25czrVWuWhefRojCDOvuKJkb/RJ2Hpds/FTMtIQ5lwd1twyhbmnQC0XS7yDledzyi1xUNUL2pmNEuGvwrSEh0cHfyZtpRO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OE4GeUWGtaJpJ9V+YU8Trwj3OXwzvQnMDOpg6v7iEwQ=;
 b=xsQoHb+bI2G/nMnc58wVIw6skdVkGSZPpy9WcVDxdAWeZ7gjlckGM1omPkkOjTGe0paL4g46rqce8EgZx0RgvIN0B6oMGJzh4+ELMFD3aYhyOM6sfoeaYWnBj1LeHKUQ92V0Cq18U2ct3BTB32xMWLv67udg68EXfKpEAYAFJr5NFq/yxa0ZHPG1AsD0bzeG9d5LAFJerVAnkcrqKzCwFgZoy9B4VU5YqQwdTbXfH5wws78s8lWkSAYVTepPB+W9lnatzEBtx+D6ML61Pt7xZHPhU7ukZEYXBvLqM9ioDuG+DZJ0M3E/Gx8Wt55qquIoWwPRZO69oQNOyUGnU47sZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OE4GeUWGtaJpJ9V+YU8Trwj3OXwzvQnMDOpg6v7iEwQ=;
 b=U/tfyybXFYCL/9y3A7Jl9sf0IYGSXEDIjXbUaWmXFEhHoSglrrUL4Mf2g8RlHxSBUUOVkqlUXfHuvtG5m9uWxdr2O5K/HBfoDll2qgdNXZa9LLbp/l/CDZRDaOjPI5gdLkKvrJzD/2oepRjbMpPbcT2tDBCKNGMrHNgtzHsOlDS10VQZQQrRvJ1pT1y+4D4ZJTLc/slfIkw5u6MwpFIYckQ7JVSyZNOFVjjg/rMgKAG6E02QpVF9kx7SyRpuF20AFSk0x4XQ+WsrLOOGu8DQEbvynW7THaLsECWZoc4ai1YEKV+fuYEey/B0SBw6YJxJSRfmkutIHGZhS607UEKfNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Sat, 28 Feb
 2026 06:11:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:11:07 +0000
Message-ID: <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
Date: Fri, 27 Feb 2026 23:11:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:254::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b6ff5d-c264-4e8b-e461-08de76902952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	PgKwLf9d9WpuGgPPp3pXgsGgC0w7HAJK/O+0ZYJI8lh9HI6ojKEE4lH+u59sjx5FsMtD1Ir7IDJCB9DHWuZMrdSn/xQ9y+c2oDThhzce9WprxYXB+wI28p2/eZAuoDe9jx4oj66yil1IoEr/qo+0J4/X66yZr2y4OCGgB/DmM2czztoeH6jehBi1l941YpOT3KhqURItrmqvEkxnRaqBslLEcV/4vdWEsPwtb3C21KHeEFIGxr15ttcfzbQlqL8lEMxUQJb1KVylyGvIFzSBM/zfgPXrlaOEV0tgCNNKXZnr4xFXsE8s5EZg/s6uaS5qKkR40qGK0sTKXjp886xW4j67mdecZFCE9beGDHwrB/ovjAp2XQDYF0QE9tlpk7leiSc2Q1Abt9mWh1nTWkpdcQz1XQ2ZL85rLf5dsaxsQsMUioNul/ee1QYxH5Nv4uAPmNgG3PAE1LT6ySFS37HT/KiIH2Pnktxn/nVVQqFtTM3jHhi1lo3xHwM3o+m2aXWJD2th/X8T6EjfESKSlmToCLnrayF68QBC9TuxZ2vHq7xZh5elkqV9HBcF56ifrTTpSGI1MfR4u+CWyU6f7RHYaaodhfxiBl/3K6X5/3Xkys3ANZ7qmFU9FcxsDKw6JrZQj8ly5k11VmYWkaoxfpAQrORz4AYzwtYnSjpin7sQ2GUXwl4SFT/BNTPYnZB9Cxw0AXWtinXy/Xfs3rW5QGB13/aflb8Z9WIHLnblHU9Xcac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFc0a1FVSTJxS0xwTWdEZGJVQzdEMHJiQTRQd1hIaHdwTmxDK2hzN3BSYzZs?=
 =?utf-8?B?L2E1U1NZS0h5YmRIY245RWovTSt0c2NGRkdZRm5lYTh4WVdlSHpnUXV4bytw?=
 =?utf-8?B?MkVaUURGNHZ3WFE0NWNiV2taTHgrWWxVL1lDcHJsbXd1TGhaRDRJYSsyMXM5?=
 =?utf-8?B?dWZUQ0pLdEZWZzBpWGxPbjVwTXRNNVdRZSt2M3dXMDg1a0t3ZHY3eG1QVDJ0?=
 =?utf-8?B?dXlJMWVTd1BvcStaemZwQjJjd0hqVnhDVGVTRHdSMkFpS0VUZ05nNUlxaFpZ?=
 =?utf-8?B?K3VhT1VaY2RJU1BWblNJQjV1cFdlNGttYWZyYVYwbitJYTc4K1M1ckowcUhV?=
 =?utf-8?B?dmgwL2hLS1E5WnNvUW1FQ0NKa1c2ampVZ293T1NqS3FxV1F3ZWh2bGo5dW9T?=
 =?utf-8?B?d3lSVGw3RnFINGZ0T0YrclFBd1cvVExqWVlxMEc4ZlNLTGZzUU1TMnlHcWRn?=
 =?utf-8?B?blhscmFEMTNVaUlKZ3lUOGdHeVRKOXpiR3Z6RXJ3c1hDZytuR3htdUJIODBS?=
 =?utf-8?B?dkY2Z2ZoeXp3bU1RdWtrV002UklDSkVLRThkVzZidE91M2pHSm4zN2IyYXhM?=
 =?utf-8?B?L0h4VU1PVTk5QUU1UWtBVHE0eXQydmxRZFZGbDNqZ1A2eDF0cFNScnJNOWFV?=
 =?utf-8?B?US85aGlLVVVkVU9FcFFLOUhOUVBKYlFrTzJrYWwydTJtd0FaWDNIZVdsTUwr?=
 =?utf-8?B?MkhBeHZGY241eHNQS0xtUXlkZzdCb0FGdHFTVHJ1eDBQcHk2SGU4MWlVQnVo?=
 =?utf-8?B?RVhweWk3NDZqUDlmcURsc2w0WERXM1JJb2JVQ0NOSkFqQzRjQUl5bDkzTWdv?=
 =?utf-8?B?Sm91d3Z2MGtCeXBuYjl4U25BL011VnVFNy8xcUJTUkZVTytLYytVUkQweUpk?=
 =?utf-8?B?eEJCNzRLR3licFVlREI3ZXhTMkU5djdhWU9wTC9Mai9DSEsvV0tSRGMzdHdj?=
 =?utf-8?B?RjZZbDBBVGczZVBXVkJjOU9QQnlDbE5GRG0xWU5XMWdRWHQvNkh3eDdkVFV6?=
 =?utf-8?B?YWZpOVVPNkpWdXJSbzNjcjU0dGRsaDdRcndQbE11OU5lSFluczBMOTlXQUZp?=
 =?utf-8?B?R0EvSzZYbWlwVFdNNjBVOE8reGtZRU1ZNlpORzlINzE3N2ZBT1N6bUI5MnJH?=
 =?utf-8?B?Si8rOUhmTTFsNWxKNkx4MzJISWRCOEhjUUNReGV5ZEJ2NU5OZUI5cmlDMTlD?=
 =?utf-8?B?SEhzOEozNXg0MGd6MjBmOUFxaVJFY1A1Y0lsd1pyNHEyK0JtS2ZNN3FqSkZj?=
 =?utf-8?B?QjFoTVRXcnpRSVAwOEtDTnQxVS9COGhiQ0NHWDlvYjFSekNCQyszdFpXTXBh?=
 =?utf-8?B?ZnBaS3FkWklFWHVNVURmYVdOY3B1NmVYNDhXK2pPRm1EQmFQNnVJMUxKaC9Z?=
 =?utf-8?B?QXBhQ0liL1NJQTRLNHQrNTFlVCsyQUtvME4ycVJ4ckoralNQK3Q4QzdVQXhr?=
 =?utf-8?B?OVo4QnpWOWhMSjkzWXlTOFlVTzJUNHNTZjhsRTNLTkhpQTR3NWhLSXZNWCtl?=
 =?utf-8?B?TUlEcWFkT2tDZUJ5Uk1oY0dqUmJudzZXOVhPZlpDTldXbnBnQ0NvdlhFRTFY?=
 =?utf-8?B?dzVtZGNQT3pOSXRUYVN6ZHBvNFAwNCsrQ1ZaOVJQcFRTNk94MWlvbi9ocE84?=
 =?utf-8?B?c0lNamMyYU4zb2U1d2F5TDNLMnNFSSt6ZStoQ2k0eW1mU2gydXUxTHJKdGcr?=
 =?utf-8?B?Y1F6eUxNU1c1VFVGeXdjMWFrKzJmdXNnb2IycExKTDNUYzhMRXExM096WmVp?=
 =?utf-8?B?QWZHNWUzZ2tYd0RCRkVCdnRUWVNZQUJwTnQxZ0FmZi9memhXbGJRMGZyYnJG?=
 =?utf-8?B?SFdYSEplKzEweTBuSGJNMTJsY0xyNlBLbFNUaVpwMUdEeHpweUlNQ2JEUHJh?=
 =?utf-8?B?UzlMVnBzdUthRkFFV1RmOEcwdDZLcUxvQXVtRzQwaHlCcmNVTElYT1QrMTRJ?=
 =?utf-8?B?NkxGaW8rNk9hT1pEQi9ZcnUyM290UzFMRHZEMURHdHNaSktzdGZEZ0hrc3Vh?=
 =?utf-8?B?V2wyMXIyYzhKZHppY0Z3RVk5Z3Q0RHJJNkJHSWp4OG8xZC85T2lFY0d4akEx?=
 =?utf-8?B?SklYaTRxL1FrTS9VNjZnQitPN2U0czZiOFUyYlkwY25CVWMyR0ZMZ291c0hw?=
 =?utf-8?B?L0FzZzAzeWVTT2lzNFNaaWlLbW9hZVdBNjh2V0hoRGVBUzZ6V3AvdHNmYXZN?=
 =?utf-8?B?eXI2dHdjMG1YNkVScXBZRjdTYU1LOHZWOTVlOGJCdGQ0TDEzM2dHVjU4RHV2?=
 =?utf-8?B?cGVJWEs2cE1lenkxbjh5eVo5OEYwdlNUNmR6bUJRckptR2NjNGVxR1NGMnpK?=
 =?utf-8?B?NXo2V3phVXd1R0l2eHA5SG5vRDFRS1hmMjZZWVBZVzUvbkhoQWVoUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b6ff5d-c264-4e8b-e461-08de76902952
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:11:07.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcI9v2ZLdl4gbf8Gf9H9i5xCv2mZicjtX/O1KPYQCdXdDKQZkYKgcku3CtiGINKhAzonCQp2A/GXyBF98X+H5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757

On 2/26/26 7:50 AM, Eliot Courtney wrote:
> Add sync and async command queue API and the type infrastructure to know
> what reply is expected from each `CommandToGsp`.
> 
> Use a marker type `NoReply` which does not implement `MessageFromGsp` to
> mark async commands which don't expect a response.
> 
...
> +    /// Type of the reply expected from the GSP, or [`NoReply`] for async commands.

Hi Eliot,

The following does not need to hold up your patchset, but I want
to bring it up somewhere just to work through it.

The sync/async naming that GSP RM uses is a little bit "off". I
spent some time discussing it with them, and the problem is that
sync/async is a concept that is somewhat independent of whether
a reply is expected. Usually, sync means a blocking wait for a
response, which is not necessarily required in all case with
GSP RM calls.

The naming would be better here if it reflected simply that
a response is expected, or not. I don't have great names for
that, but "fire and forget" works well for what we have so
far called "async". So we could do create a convention in which
no annotation means that the API has a response that will come
back, and some abbreviated for of "fire and forget" or "one way"
added to the function name would mean that no response is
expected.

Again, I don't think this has to happen here, because we can
go through and rename later, no problem there. But when I saw
the sync/asynch and remembered the very recent discussion, I
figured I'd better post something about it.

And yes, I started us off in the wrong direction with the
IS_ASYNCH thing! haha

thanks,
-- 
John Hubbard

> +    type Reply;
> +
>       /// Error type returned by [`CommandToGsp::init`].
>       type InitError;
>   
> @@ -604,7 +611,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
>       ///   written to by its [`CommandToGsp::init_variable_payload`] method.
>       ///
>       /// Error codes returned by the command initializers are propagated as-is.
> -    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
> +    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
>       where
>           M: CommandToGsp,
>           Error: From<M::InitError>,
> @@ -626,6 +633,51 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
>           Ok(())
>       }
>   
> +    /// Sends `command` to the GSP and waits for the reply.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
> +    ///   not received within the timeout.
> +    /// - `EIO` if the variable payload requested by the command has not been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
> +    ///
> +    /// Error codes returned by the command and reply initializers are propagated as-is.
> +    pub(crate) fn send_sync_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
> +    where
> +        M: CommandToGsp,
> +        M::Reply: MessageFromGsp,
> +        Error: From<M::InitError>,
> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
> +    {
> +        self.send_command(bar, command)?;
> +
> +        loop {
> +            match self.receive_msg::<M::Reply>(Delta::from_secs(10)) {
> +                Ok(reply) => break Ok(reply),
> +                Err(ERANGE) => continue,
> +                Err(e) => break Err(e),
> +            }
> +        }
> +    }
> +
> +    /// Sends `command` to the GSP without waiting for a reply.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the timeout.
> +    /// - `EIO` if the variable payload requested by the command has not been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
> +    ///
> +    /// Error codes returned by the command initializers are propagated as-is.
> +    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
> +    where
> +        M: CommandToGsp<Reply = NoReply>,
> +        Error: From<M::InitError>,
> +    {
> +        self.send_command(bar, command)
> +    }
> +
>       /// Wait for a message to become available on the message queue.
>       ///
>       /// This works purely at the transport layer and does not interpret or validate the message
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
> index 74f875755e53..47ca31611927 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -26,7 +26,8 @@
>               command_size,
>               Cmdq,
>               CommandToGsp,
> -            MessageFromGsp, //
> +            MessageFromGsp,
> +            NoReply, //
>           },
>           fw::{
>               commands::*,
> @@ -53,6 +54,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
>   impl<'a> CommandToGsp for SetSystemInfo<'a> {
>       const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
>       type Command = GspSetSystemInfo;
> +    type Reply = NoReply;
>       type InitError = Error;
>   
>       fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -104,6 +106,7 @@ pub(crate) fn new() -> Self {
>   impl CommandToGsp for SetRegistry {
>       const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
>       type Command = PackedRegistryTable;
> +    type Reply = NoReply;
>       type InitError = Infallible;
>   
>       fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -183,6 +186,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
>   impl CommandToGsp for GetGspStaticInfo {
>       const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
>       type Command = GspStaticConfigInfo;
> +    type Reply = GetGspStaticInfoReply;
>       type InitError = Infallible;
>   
>       fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -236,15 +240,7 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
>   
>   /// Send the [`GetGspInfo`] command and awaits for its reply.
>   pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
> -    cmdq.send_command(bar, GetGspStaticInfo)?;
> -
> -    loop {
> -        match cmdq.receive_msg::<GetGspStaticInfoReply>(Delta::from_secs(5)) {
> -            Ok(info) => return Ok(info),
> -            Err(ERANGE) => continue,
> -            Err(e) => return Err(e),
> -        }
> -    }
> +    cmdq.send_sync_command(bar, GetGspStaticInfo)
>   }
>   
>   /// The `ContinuationRecord` command.
> @@ -262,6 +258,7 @@ pub(crate) fn new(data: &'a [u8]) -> Self {
>   impl<'a> CommandToGsp for ContinuationRecord<'a> {
>       const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
>       type Command = ();
> +    type Reply = NoReply;
>       type InitError = Infallible;
>   
>       fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -356,6 +353,7 @@ pub(crate) enum SplitCommand<'a, C: CommandToGsp> {
>   impl<'a, C: CommandToGsp> CommandToGsp for SplitCommand<'a, C> {
>       const FUNCTION: MsgFunction = C::FUNCTION;
>       type Command = C::Command;
> +    type Reply = C::Reply;
>       type InitError = C::InitError;
>   
>       fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> @@ -412,6 +410,7 @@ fn new(len: usize) -> Result<Self> {
>       impl CommandToGsp for TestPayload {
>           const FUNCTION: MsgFunction = MsgFunction::Nop;
>           type Command = ();
> +        type Reply = NoReply;
>           type InitError = Infallible;
>   
>           fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> 



