Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B93C77B62
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Apr 2023 19:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbjDET3K (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Apr 2023 15:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjDET3J (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Apr 2023 15:29:09 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75895FE1
        for <rust-for-linux@vger.kernel.org>; Wed,  5 Apr 2023 12:29:06 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-947a47eb908so59785566b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Apr 2023 12:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680722945;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HjS4xiLUH8Vl6mwX+ydicDNhQfS/HlIJ5pcb18flIFA=;
        b=FBmtIvVfM4pGQI0Ecn5kpWqT9ewv/aw4Fo78eRrx1HwuZBp4iXUV5H057Luk2hvw2u
         ulz9ur/hM3WMIFn4fbzHBA2uvVARF0Kv0zsR5L7enELuauqiMc0abH4qMusRV/lI+9z6
         rMCS6thBW9YJ4KbSlkrUTkyEBTGwzwnZC74V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722945;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjS4xiLUH8Vl6mwX+ydicDNhQfS/HlIJ5pcb18flIFA=;
        b=C2eXoHMZIpVVsiJqX7pPRuYXwDLPfcDvKS6cYB4hKk8/u0pNT3UFi2xYC2XgiydyyK
         MmIlnW1vxRQjz4OaUb/8tXZphRg6HHo9aFOp4ufKwacg3cqyPctDUL1bAfvyiLUFZzs1
         tKUCYmb+X2NOQU/+Puf3i0fstWa8Z6kVynzHHLkw+YT3C+PFejZTUfvfgGxUxk+SyAq5
         ZCAYD7DRm75MMVlxmtvWm7RgsVxyG8sVW1UbMuJRQJ29BTTT735MJOQczedv2Jna9zNh
         i0YSaKPmNfq0tLH8QDx7O28+91z3cxhop1Woj6P/buxi0q5dFPIyEjrf2gAjk5uVgzxi
         T5pQ==
X-Gm-Message-State: AAQBX9fW9qoaqqiNidCkAXSfmnn/wgKxDZnPpV5rnO4Xm9aSf29/ULSU
        IYN0PayGwHvJ7SN396mQEOfrJQ==
X-Google-Smtp-Source: AKy350YXaXE3UsMcWjKsIKz3/lGkR1neWBZc+WNbMetS2a0zQrsKbODyiNsB5M3OyGWh53lfa89J9Q==
X-Received: by 2002:a05:6402:524e:b0:500:3fd0:25a8 with SMTP id t14-20020a056402524e00b005003fd025a8mr3953373edd.0.1680722945234;
        Wed, 05 Apr 2023 12:29:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id cq5-20020a056402220500b005023ddb37eesm7596632edb.8.2023.04.05.12.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 12:29:04 -0700 (PDT)
Date:   Wed, 5 Apr 2023 21:29:02 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Asahi Lina <lina@asahilina.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 12/18] rust: drm: sched: Add GPU scheduler abstraction
Message-ID: <ZC3L/uinmOwI+FbI@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-12-917ff5bc80a8@asahilina.net>
 <ZC2XBfJGAdNMQjpZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC2XBfJGAdNMQjpZ@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 05, 2023 at 05:43:01PM +0200, Daniel Vetter wrote:
> On Tue, Mar 07, 2023 at 11:25:37PM +0900, Asahi Lina wrote:
> > +/// An armed DRM scheduler job (not yet submitted)
> > +pub struct ArmedJob<'a, T: JobImpl>(Box<Job<T>>, PhantomData<&'a T>);
> > +
> > +impl<'a, T: JobImpl> ArmedJob<'a, T> {
> > +    /// Returns the job fences
> > +    pub fn fences(&self) -> JobFences<'_> {
> > +        JobFences(unsafe { &mut *self.0.job.s_fence })
> > +    }
> > +
> > +    /// Push the job for execution into the scheduler
> > +    pub fn push(self) {
> > +        // After this point, the job is submitted and owned by the scheduler
> > +        let ptr = match self {
> > +            ArmedJob(job, _) => Box::<Job<T>>::into_raw(job),
> > +        };
> 
> If I get this all right then this all makes sure that drivers can't use
> the job after push and they don't forgot to call arm.
> 
> What I'm not seeing is how we force drivers to call push once they've
> called arm? I haven't check what the code does, but from the docs it
> sounds like if you don't call push then drop will get called. Which wreaks
> the book-keeping on an armed job. Or is there someting that prevents
> ArmedJob<T> from having the Drop trait and so the only way to not go boom
> is by pushing it?
> 
> Googling for "rust undroppable" seems to indicate that this isn't a thing
> rust can do?

Another thing that I just realized: The driver must ensure that the
arm->push sequence on a given drm_sched_entity isn't interrupte by another
thread doing the same, i.e. you need to wrap it all in a lock, and it
always needs to be the same lock for a given entity.

I have no idea how to guarantee that, but I guess somehow we should?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
