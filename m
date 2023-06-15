Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D5CEB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 15:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240463AbjFOPdg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 11:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238807AbjFOPdf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 11:33:35 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D17A2695
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:33:34 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b50a419ab6so2626635ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686843213; x=1689435213;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jPakVkd9U44iQJPxq86OrJM9+VpbBNbx9fiWI9yUps=;
        b=U4j3Fopm2S4nEbc4DSCrT4frdeViJRiulaCJHOsbe1wyO5vkCkDJtlMwAdcKrxuJDR
         xzFJ2ChGLu2yYMZzMLpjjBXMYYQfLAiwBktnwfo62SFgJvsTXI80fRT18K8RCeU4EaGY
         sxnW4mwGpBbWD6aP6moLxGKbmFndSWB8swIkkWiIQ+t/SjS6hMHrvZUukgUM1+SFxzzv
         bjp4kE6uEsP3qpBjx3/cOazkjvIzQWbbCZE8V19Nn0yb7+1Gm+G6MNC+WYB5WnHosgv6
         IOA0/g3gc6byPNT7AZ5o+GbUURZDloAXTTV6J5D80DOpXGLRNyAW6YyA3gXq1kPOPikJ
         wUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843214; x=1689435214;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0jPakVkd9U44iQJPxq86OrJM9+VpbBNbx9fiWI9yUps=;
        b=QaeCmmKRMOOoKl1wkK/oLsrlsy4sbQH2LexjnOwJpGSKKUIKBUD+6JZhbomO984lBx
         //f/LxwG2TncaAVkHAeDSykfNB+2ubH59wnEYzsfodNgklhObf+Bp1upOtnlIoTtf4Cg
         AxXpxLEjTDuHj+8CPu5x3cdRk1dCLwoCVtYx2jjvzs6u/Y/8ltdLIX0J9sINSq3fAvcN
         tmf39FyJZqOEvjc+UxWgAPagWYsMvE61zOzEkarhsbmfoVRBhVteQu7DZYvPCidHno8D
         GUgx2bC986Ityh9irU5OpjC19D/cRdCAxUVil63JZuX9eWoe2PbGLJ7xYqnVtbIZyZLL
         rGlg==
X-Gm-Message-State: AC+VfDzXl7mE5gzJ5TkP3fkrbiZq9P42qPZb7sWQRXlvmhnfLYaqyjYW
        /CotX0/g+fOdVlzaVsQNhZlijzJ+9TxtKA==
X-Google-Smtp-Source: ACHHUZ4squCoqHNI9WsDyCEpYBMQ1ByG518pS8vm32ZwrwpfcCtDkVNE7FHHnddD05Yz7qIgq5a4kA==
X-Received: by 2002:a17:902:e844:b0:1b3:ebda:654e with SMTP id t4-20020a170902e84400b001b3ebda654emr9541413plg.5.1686843213369;
        Thu, 15 Jun 2023 08:33:33 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001a69c1c78e7sm14309411plh.71.2023.06.15.08.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 08:33:32 -0700 (PDT)
Date:   Fri, 16 Jun 2023 00:33:32 +0900 (JST)
Message-Id: <20230616.003332.1054459016794046709.ubuntu@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2023061544-pony-nappy-78cb@gregkh>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
        <20230615142311.4055228-2-fujita.tomonori@gmail.com>
        <2023061544-pony-nappy-78cb@gregkh>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu, 15 Jun 2023 17:01:06 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Jun 15, 2023 at 11:23:10PM +0900, FUJITA Tomonori wrote:
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> For obvious reasons, we can't take commits with no changelog text at
> all, nor would you want us to :)

Oops, definitely I'll write nice changelog in the next version.

thanks,
