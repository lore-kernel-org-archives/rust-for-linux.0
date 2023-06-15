Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45685EB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 15:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241646AbjFOPYe (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 11:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240850AbjFOPYd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 11:24:33 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7702126
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:24:32 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-656bc570a05so1870744b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686842672; x=1689434672;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7FiwHqz7+AQksGgPx/i2SvyL75VvYGH9BPBawGYWtY=;
        b=OndRgdSh3qijOkanZMDvR3G9tgFkW2DrkkehzAxkFViLk6g3E3XukaGJSBifyk3vx4
         NU/yYrUhAG53p5cW6QM++doxXYD155gx07dGkTESwhyZJ4D4c84sw8O6p8JwRnIxLE0+
         LSgYPVHEy3Pi40SODaflaYX+NpgTyEavD+Nxh6A0rRBa74Cy9+4Xjwl5ubFaFLM3pwQZ
         NmGcd5kB8JQfMtSLh3jB9O6voxj/L6y9Yh9XGto64baaFbkBwp/ok2fTeBfNr+uaaUn5
         InYTbSo8ofpkvEy6RBpOLWIeCak4GOgVnrbp7P+YmhTHXR8LB9BEZZR5jWMC/0M2sxcw
         IDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686842672; x=1689434672;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q7FiwHqz7+AQksGgPx/i2SvyL75VvYGH9BPBawGYWtY=;
        b=K7OMBCeZpG/J4Lb2z0s+mvt+UmTPq3tQFnlTCgAHzl2fXyxnbUVzUD3jIgiE0QpgkQ
         +xNMEfc8MiQllWSduuL0PkW0azmtNKKRIiqUtwdIz01mC14DcSDwGva0EXnTnsKjVPtb
         txVUlhhK6pWWWWeZ63uFmbOVXXjOHWTpUfk5xzUp3h8BH+JF0kbl1Yj59CAHDjmvuMol
         v/fHUzm2847SvD6zBN6LCMiu4MW2rRdBew3Byscvc8/qzhWQw0Ux+ldgmjlqomyTG7N8
         rrA7E/Yaza9KbOstvIa92a5YqZpjVkq4R22xdpcFpAdRZlJXfxyD+VeFuH1tsoZC0DES
         IPig==
X-Gm-Message-State: AC+VfDzUJpXEc0zZ9M6ivy4Jp7Y2+akq0uoX6uuod4Ao4pcZ6hBWU4AA
        Ll1TvhEAxOXOtQEPqLL5ndw=
X-Google-Smtp-Source: ACHHUZ5Tp+teDz5JBtMffn+6Btzt+e2tSwTsv3/N9vwhs31k3i11dB4DX+xnGnIbNmMJv/iGfjjFvw==
X-Received: by 2002:a05:6a20:5499:b0:10c:8939:fc48 with SMTP id i25-20020a056a20549900b0010c8939fc48mr21459941pzk.3.1686842671494;
        Thu, 15 Jun 2023 08:24:31 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id k4-20020aa790c4000000b0063b8d21be5asm12507028pfk.147.2023.06.15.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 08:24:30 -0700 (PDT)
Date:   Fri, 16 Jun 2023 00:24:30 +0900 (JST)
Message-Id: <20230616.002430.2137536116433584686.ubuntu@gmail.com>
To:     alex.gaynor@gmail.com
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAFRnB2UCnidghmfBPeZr19R68njuzH5yEqGmd5gjweaq3k=yUQ@mail.gmail.com>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
        <20230615142311.4055228-2-fujita.tomonori@gmail.com>
        <CAFRnB2UCnidghmfBPeZr19R68njuzH5yEqGmd5gjweaq3k=yUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu, 15 Jun 2023 11:02:31 -0400
Alex Gaynor <alex.gaynor@gmail.com> wrote:

>> +    /// Calculates message digest.
>> +    pub fn finalize(&mut self, output: &mut [u8]) -> Result {
>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        to_result(unsafe { bindings::crypto_shash_final(self.ptr, output.as_mut_ptr()) })
> 
> Is this sound? What happens if output.len() < the digest size?

Good point, surely we need that checking before calling crypto_shash_final().

It will be fixed in the next version.

Thanks a lot!
