Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3A6C47082
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 May 2021 18:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B43E613AC
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 May 2021 18:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhEZSX4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 May 2021 14:23:56 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:54773 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbhEZSXz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 May 2021 14:23:55 -0400
Received: from [192.168.178.60] ([87.158.135.23]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MI5cP-1lgDXt494x-00F9Bu for <rust-for-linux@vger.kernel.org>; Wed, 26 May
 2021 20:22:23 +0200
From:   Thomas Thanner <e580@thomasthanner.de>
Subject: Re: Error building sample modules
To:     rust-for-linux@vger.kernel.org
References: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
 <CANiq72keqzr2vraGSOcC4=Ew=Ax6ds_m7E3Gy2az3JLzmtcnsg@mail.gmail.com>
Message-ID: <269315c9-56af-6914-2315-b1248519a737@thomasthanner.de>
Date:   Wed, 26 May 2021 20:22:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANiq72keqzr2vraGSOcC4=Ew=Ax6ds_m7E3Gy2az3JLzmtcnsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:CR4Nn5/xfbpanSRJuuthtpBpGadvcp8nm/UjL36VPVybw77y9ki
 0qjEMM0aNfgXDXamc3QCt3xgXJziJE5iDdavxEm6E1ApUUOCxzZDlYxuv/yLo8Rd8wN4eT1
 u84Y8hTC8NANu5Qa6X+45YIxrfx/QHSfId/citdVnWfmF1Q+85fFQgzMxM6kRrsR7N0VyXe
 X2GhU1oeJPPS7NZdo0bow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yBrKd8EXw9c=:E/6BO7aZJbMf7j8+BznPlu
 NwHRrKmVc7DYvhXpOLl/wD77M/170WJ1qDGSISolc3gtmfTbf5yoOzy6KG5n0eXZ01+h5S9lD
 yP0pOj+6jAnnupnGYhBr/XzYs/ZWoNWD9Uen/eSxqsMC9b8tBPnK4UJItCsIJfhPPAjRsWLlb
 W4wxF603DU4U8T20H7vhjiJsZmUyB5HTVhKr/hUDU+wtml/dKytfoJE2T0MxlcN40SZHAiynC
 oyqu5yMy9Hj7CxLWqThppQTwIIBf9pw3nNy82lVenqggUhnqwD1Yd0nbFXq9ATcQ1g4rrSbNn
 34j+KPO129iCT+E8lMvacntZ+vWpsykyZkEiu9f1B4MS48BXIli57zsTLWQN4HN0VUM8fQqmy
 g83ui7DsS08R3ZTsNyEgC0t+U/d1x1tzhjvIApJbUZMT5/dVVRHJ0AENDxExQ86uVL6q6UhIh
 dPe0S7hMAhViCoeVcKKmbcU0qDfKsFHOaRGdfI7YxbFg+LQBOzo8T3byn7OeCvFZirv1spCI8
 sfdirOsIJKfAMEz/3YtBYU=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel,

yes, thanks, that worked.

Now I have two built-in rust modules. And two loadable modules.

I have to compare that to normal linux modules. The built-in 
rust_minimal doesn't show up in /sys/module. If I do insmod 
rust_minimal.ko then it shows up. I have to do that a bit more 
systematically with the four modules.

Thanks for the moment

Thomas


On 26.05.21 04:21, Miguel Ojeda wrote:
> On Tue, May 25, 2021 at 8:24 PM Thomas Thanner <e580@thomasthanner.de> 
> wrote:
>> ERROR: modpost: too long symbol
>> "_RNvXsp_NtCsbDqzXfLQacH_6kernel12module_paramjNtB5_11ModuleParam5value"
>> [samples/rust/rust_module_parameters.ko]
> Sven privately told me he recalls this being CONFIG_MODVERSIONS (thanks!).
>
> Thomas, can you try disabling:
>
> Enable loadable module support --->
> Module versioning support
>
> (Ref: https://github.com/Rust-for-Linux/linux/issues/59)
>
> Cheers,
> Miguel
