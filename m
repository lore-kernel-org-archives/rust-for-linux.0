Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7E7C3DA7A
	for <rust-for-linux@archiver.kernel.org>; Thu,  5 Jan 2023 18:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbjAESoh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 5 Jan 2023 13:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbjAESoh (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 5 Jan 2023 13:44:37 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C6D1CB02
        for <rust-for-linux@vger.kernel.org>; Thu,  5 Jan 2023 10:44:36 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id p188so5738291yba.5
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jan 2023 10:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0toAN08xKzvxT9EDM/+eKNjHQDqUv6d3mUhug1+aKe4=;
        b=SxBsRMkrQnQKEnZCfelpsUOHJ/4vXRWz79w/5ddwMXp6S6ytzHdpGWvdqDyVwnY0vy
         PK7Da+/Vj8ENerPSJHDJY5CDFgLFtYw5LGyTetlPJtK5syVzu7Fm/tD1N9SJ8/2njMFw
         wWaUq4DYUIj52zhv1M5oovp7F7EQqj/WO0g7tYYjKttx1m0dT2whKYanc5Z5lnRt8xvj
         x+YclO8Baxe9e1F+di7NO5S2hPWX/TTQ1H+ZtlRwVbpJ4eXVWm6YSmQf9Yd5zuWRIzVw
         7AX8ktbliVSqTSil1caUwjZ0FtkOZ9FPwe2qZVtnemHC6RHBbsBzRfPvfK2BKxfEQMkH
         RKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0toAN08xKzvxT9EDM/+eKNjHQDqUv6d3mUhug1+aKe4=;
        b=oxV28bl7URAuRaMsFonJcMNFLSpEo2zVjWvjRr7LXBWaVoIerzjQ/HlXAjIBJIS9Ug
         SySzOTmHbegmwP9WV4mAjSdvDzoSZKc4HRFdipuM/kjQ8M7X2pesUoF9JyblRBYwKTqD
         /z9f8BuTOzrg1KSZwcbmEPleBEC3aTrpjFyVCNBcKrNWObA4OyzeBiZ2YSEAmTQ3TV7g
         0VvdcuxhRTB28mSWm0VoTtR0/FnlbxiLIOvaAeW3+Ft2r0Lg6eKmtn+3CpplWTVykZxN
         KmHowpMMwXryh/SUSul1vAYc9yBnkNbUhg45xHVm9bei1Y2wp7smZYxlUz/EKrtgaTKg
         7Iig==
X-Gm-Message-State: AFqh2krCm2IbRjHwOGdbfhexeGTDJ9P4LE4mgJqvyCDcriBAZO7yVJY7
        ZpxgOWtMTXkOuhBiC+yGutEeuQ4O6bLDEbbfUlGnE20uc1vY+f0hPb8=
X-Google-Smtp-Source: AMrXdXt4xXJuRJiFEoDDoIO/h5rTadr8EVL97GapW3zsEej9wOMVCaWlke5RFkCJzt8R9++z0cbzgKvoPoCsC/FQ79c=
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr6133694ybc.328.1672944275256; Thu, 05
 Jan 2023 10:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20230104160405.5530-1-apantykhin@gmail.com>
In-Reply-To: <20230104160405.5530-1-apantykhin@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 5 Jan 2023 19:44:24 +0100
Message-ID: <CANiq72=mgZCC7ECEO=bqLQ2rJKQjqS7Sg7CW51_mpX4VcG7o6A@mail.gmail.com>
Subject: Re: [PATCH] scripts: avoid redundant re-reading makefiles.
To:     Alexander Pantyukhin <apantykhin@gmail.com>
Cc:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Alex,

The commit message is looking better, thank you. Please see comments
inline below.

On Wed, Jan 4, 2023 at 5:04 PM Alexander Pantyukhin
<apantykhin@gmail.com> wrote:
>
> The main goal of the patch is avoid redundant re-reading makefiles
> if these were read before. This is performance improvement.

Like it was mentioned in v1, could you please give a rough estimate
about what is the improvement from old to new? (in particular, without
the other changes). That way, others can get an idea whether the code
complexity is worth it or not.

> Additional code improvements are using 'with' when read file and check
> if file exists.

Note that others submitted an improvement for the missing file case as
we discussed in v1, so it would be better if they submitted their own
patches for those. I am Cc'ing them so that they have a chance to be
aware of this patch and potentially submit theirs.

In any case, their approach seems more idiomatic for Python [1], so I
think we should do it that way.

Finally, the title of this commit should probably start with the
"scripts: generate_rust_analyzer: " prefix, otherwise it is a bit too
broad.

Thanks!

Cheers,
Miguel

[1] https://docs.python.org/3.11/glossary.html#term-EAFP
