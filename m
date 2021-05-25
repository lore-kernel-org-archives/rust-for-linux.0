Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAD0C2B9F8
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 May 2021 17:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF7A1611BE
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 May 2021 17:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhEYRrf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 25 May 2021 13:47:35 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39187 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhEYRre (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 25 May 2021 13:47:34 -0400
Received: from [192.168.178.60] ([87.158.138.254]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKsf5-1lzh4A37wz-00LI28 for <rust-for-linux@vger.kernel.org>; Tue, 25 May
 2021 19:46:03 +0200
To:     rust-for-linux@vger.kernel.org
From:   Thomas Thanner <e580@thomasthanner.de>
Subject: Error building sample modules
Message-ID: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
Date:   Tue, 25 May 2021 19:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Provags-ID: V03:K1:D5/8/rf2THDuCU64i6G+oQD34rouyFk+Lbxa+f70YU9qCRi85qE
 PClccwGSZzIqpDqTddIMr7hNgaf0ROkAyNR+5Pm4koRPMIImlF/JKk+Ibvxe2zqne6ZrIOf
 NWC2Df2IGIia8tvrwNVFZBOZ1u17BcEsjxYShv0f/+k0oTEjdHTo53MYF6j2GF0l1GwzhGg
 Jg73bbEH4jz5tiekNxp5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PnTceh/wwBo=:TjKZi/+EQf0j1gGSEIRrw6
 9qrhBEUUThq/ORVsUCbwdCqms/6pNRk3udSgPvOWLdXAhskvV5dLuJQ0kItl3uk2oTBpkQvVL
 hWuds17qrmjfbe4D8MmXTxAuNSrR6piCyoMtI/vIMtqqMQ6Tbxqn2EctVe1eK1lK9FBAsS4oS
 EnoK+de8eQDGCRn5ddIkYY+sfwCy5wRIJyXMvkaU2nH7ucY+s5lv7wMY/m7rr/vX53jADdmU0
 I+lFwfPUQdWWM/Q7OHKQPRvIBn46pFGo+0FAJa5wukGL04v6j1GN5Taxmtib7K4tLXQcvwYVT
 /uVF1AkWBiLO0o3xHBVV0/qdK/4ArIMci/IJw+vC1GSKewbeoHzMoIQP4+tLoadlS1qZxHPER
 gOM/4AWApl8BOmAekzUc7PEyEgi1aoiIuuP8XsaBjYhtKf3wsO6/buypJsO5mpaW21yNfN21l
 EIbMQdAlNG5moJIa2WNV0C4yjbl98ObrLglz0OVxEHZwuAcdNARtla3WjjblfLevwiKJJDmGG
 WDEyPf3xl8rYdg3AsCe5fI=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I get the ERROR below building the rust sample modules.

Has somebody an idea, what I make wrong ?

Thanks

Thomas


make LLVM=1 -j4

...

...

OBJCOPY arch/x86/boot/setup.bin
BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
ERROR: modpost: too long symbol 
"_RNvXsp_NtCsbDqzXfLQacH_6kernel12module_paramjNtB5_11ModuleParam5value" 
[samples/rust/rust_module_parameters.ko]
ERROR: modpost: too long symbol 
"_RNvXs0_NtCsbDqzXfLQacH_6kernel5printNtB5_13LogLineWriterNtNtCsbDqzXfLQacH_4core3fmt5Write9write_str" 
[samples/rust/rust_minimal.ko]
scripts/Makefile.modpost:132: recipe for target 'Module.symvers' failed
make[1]: *** [Module.symvers] Error 1
make[1]: *** Deleting file 'Module.symvers'

